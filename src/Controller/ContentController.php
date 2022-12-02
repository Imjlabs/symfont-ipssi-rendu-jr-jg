<?php

namespace App\Controller;

use App\Repository\ArticleRepository;
use App\Repository\ProductRepository;
use App\Repository\UserRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

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
        $products = $productRepository->findAll();

        return $this->render('content/products.html.twig', [
            'products' => $products
        ]);
    }

    #[Route('/ADMIN', name: 'app_amin')]
    public function indexAdmin(UserRepository $userRepository): Response
    {
        $user = $userRepository->findAll();
        dd($user);
        return $this->render('admin/index.html.twig', [
            'users' => $user
        ]);
    }

    #[Route('/product', name: 'app_product')]
    public function getProduct(ProductRepository $productRepository): Response
    {
        $products = $productRepository->findAll();

        return $this->render('content/products.html.twig', [
            'products' => $products
        ]);
    }
}
