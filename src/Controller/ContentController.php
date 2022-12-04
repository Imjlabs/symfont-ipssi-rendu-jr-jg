<?php

namespace App\Controller;

use App\Entity\Cart;
use App\Entity\Product;
use App\Entity\CartProduct;
use App\Form\ProductFilterType;
use App\Repository\CartRepository;
use App\Repository\UserRepository;
use App\Repository\ArticleRepository;
use App\Repository\ProductRepository;
use App\Repository\CartProductRepository;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

#[Route('/')]
class ContentController extends AbstractController
{
    #[Route('', name: 'app_home')]
    public function index(ArticleRepository $articleRepository): Response
    {
        $articles = $articleRepository->findByCreatedDate(3);

        return $this->render('content/index.html.twig', [
            'articles' => $articles
        ]);
    }

    #[Route('/products', name: 'app_products')]
    public function getProducts(ProductRepository $productRepository): Response
    {
        $user = $this->getUser();

        $form = $this->createForm(ProductFilterType::class);

        if (isset($_POST['product_filter']["minPrice"]) && isset($_POST['product_filter']["maxPrice"]) && isset($_POST['product_filter']["seller"]) && isset($_POST['product_filter']["category"]) && isset($_POST['product_filter']["order"])) {
            $products = $productRepository->findProductsWithFilters($_POST['product_filter']['minPrice'], $_POST['product_filter']['maxPrice'], $_POST['product_filter']['seller'], $_POST['product_filter']['category'], $_POST['product_filter']['order']);
        } else {
            $products = $productRepository->findAllProducts();
        }

        return $this->render('content/products.html.twig', [
            'form' => $form->createView(),
            'products' => $products,
            'user' => $user
        ]);
    }

    #[Route('/product/{id}', name: 'app_product')]
    public function getProduct(Product $product): Response
    {
        return $this->render('content/product.html.twig', [
            'product' => $product,
        ]);
    }

    #[Route('/cart', name: 'app_cart')]
    public function getCart(): Response
    {
        $carts = $this->getUser()->getCarts();
        $cart = $carts[$carts->count() - 1];
        return $this->render('content/cart.html.twig', [
            'cart' => $cart,
        ]);
    }

    #[Route('/cart/add/{id}', name: 'app_cart_add')]
    public function addCart(int $id, CartProductRepository $cartProductRepository, ProductRepository $productRepository): Response
    {
        $quantity = $_POST['quantity'];
        $carts = $this->getUser()->getCarts();
        $cart = $carts[$carts->count() - 1];
        $cartProducts = $cart->getCartProducts();
        $productIsInTheCart = false;
        foreach ($cartProducts as $cartProduct) {
            if ($cartProduct->getProduct()->getId() == $id) {
                $quantity = $cartProduct->getProductQuantity();
                $quantity += $_POST['quantity'];
                $cartProduct->setProductQuantity($quantity);
                $productIsInTheCart = true;
                $cartProductRepository->save($cartProduct, true);
                break;
            }
        }
        if (!$productIsInTheCart) {
            $products = $productRepository->findOneById($id);
            $cartProduct = new CartProduct();
            foreach ($products as $product) {
                $cartProduct->setProduct($product);
            }
            $cartProduct->setProductQuantity($_POST["quantity"]);
            $cartProduct->setCart($cart);
            $cartProductRepository->save($cartProduct, true);
        }

        return $this->redirectToRoute('app_cart');
    }

    #[Route('/cart/lessQuantity/{id}', name: 'app_cart_less_quantity')]
    public function lessQuantityCartProduct(int $id, CartProductRepository $cartProductRepository): Response
    {

        $quantity = $_POST['quantity'];
        $carts = $this->getUser()->getCarts();
        $cart = $carts[$carts->count() - 1];
        $cartProducts = $cart->getCartProducts();
        foreach ($cartProducts as $cartProduct) {
            if ($cartProduct->getProduct()->getId() == $id) {
                $quantity = $cartProduct->getProductQuantity();
                $quantity -= $_POST['quantity'];
                if ($quantity > 0) {
                    $cartProduct->setProductQuantity($quantity);
                    $cartProductRepository->save($cartProduct, true);
                } else {
                    $cartProductRepository->remove($cartProduct, true);
                }
                break;
            }
        }

        return $this->redirectToRoute('app_cart');
    }

    #[Route('/cart/removecartproduct/{id}', name: 'app_cart_remove_cartproduct')]
    public function removeCartProduct(int $id, CartProductRepository $cartProductRepository): Response
    {
        $carts = $this->getUser()->getCarts();
        $cart = $carts[$carts->count() - 1];
        $cartProducts = $cart->getCartProducts();
        foreach ($cartProducts as $cartProduct) {
            if ($cartProduct->getProduct()->getId() == $id) {
                $cartProductRepository->remove($cartProduct, true);
            }
            break;
        }

        return $this->redirectToRoute('app_cart');
    }

    #[Route('/cart/validate', name: 'app_cart_validate')]
    public function validateCart(CartRepository $cartRepository): Response
    {
        $carts = $this->getUser()->getCarts();
        $cart = $carts[$carts->count() - 1];
        $cart->setStatus("validate");
        $cartRepository->save($cart, false);
        $newCart = new Cart();
        $newCart->setUser($this->getUser());
        $newCart->setStatus("notValidate");
        $cartRepository->save($newCart, true);

        return $this->redirectToRoute('app_cart');
    }

    #[Route('/cart/clear', name: 'app_cart_clear')]
    public function clearCart(cartProductRepository $cartProductRepository): Response
    {
        $carts = $this->getUser()->getCarts();
        $cart = $carts[$carts->count() - 1];
        $cartProducts = $cart->getCartProducts();
        foreach ($cartProducts as $cartProduct) {
            $cartProductRepository->remove($cartProduct, true);
        }

        return $this->redirectToRoute('app_cart');
    }
}
