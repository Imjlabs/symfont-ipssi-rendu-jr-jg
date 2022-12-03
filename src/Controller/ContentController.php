<?php

namespace App\Controller;

use App\Entity\Product;
use App\Form\ProductFilterType;
use App\Repository\UserRepository;
use App\Repository\ArticleRepository;
use App\Repository\ProductRepository;
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
    public function getProducts(Request $request, ProductRepository $productRepository): Response
    {
        $form = $this->createForm(ProductFilterType::class);

        if (isset($_POST['product_filter']["minPrice"]) && isset($_POST['product_filter']["maxPrice"]) && isset($_POST['product_filter']["seller"]) && isset($_POST['product_filter']["category"]) && isset($_POST['product_filter']["order"])) {
            $products = $productRepository->findProductsWithFilters($_POST['product_filter']['minPrice'], $_POST['product_filter']['maxPrice'], $_POST['product_filter']['seller'], $_POST['product_filter']['category'], $_POST['product_filter']['order']);
        } else {
            $products = $productRepository->findAllProducts();
        }

        return $this->render('content/products.html.twig', [
            'form' => $form->createView(),
            'products' => $products,
        ]);
    }

    #[Route('/product/{id}', name: 'app_product')]
    public function getProduct(Product $product): Response
    {
        return $this->render('content/product.html.twig', [
            'product' => $product,
        ]);
    }
}
