<?php

namespace App\Repository;

use App\Entity\Product;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<Product>
 *
 * @method Product|null find($id, $lockMode = null, $lockVersion = null)
 * @method Product|null findOneBy(array $criteria, array $orderBy = null)
 * @method Product[]    findAll()
 * @method Product[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ProductRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Product::class);
    }

    public function save(Product $entity, bool $flush = false): void
    {
        $this->getEntityManager()->persist($entity);

        if ($flush) {
            $this->getEntityManager()->flush();
        }
    }

    public function remove(Product $entity, bool $flush = false): void
    {
        $this->getEntityManager()->remove($entity);

        if ($flush) {
            $this->getEntityManager()->flush();
        }
    }

    public function findAllProducts(): array
    {
        $queryBuilder = $this->createQueryBuilder('p');

        $queryBuilder->Where('p.stock > 0');
        $queryBuilder->andWhere('p.status = :status')
            ->setParameter('status', 'active');

        return $queryBuilder->getQuery()->getResult();
    }

    public function findProductsWithFilters(int $minPrice, int $maxPrice, int $seller, int $category, string $order): array
    {
        $queryBuilder = $this->createQueryBuilder('p');

        $queryBuilder->Where('p.stock > 0');
        $queryBuilder->andWhere('p.status = :status')
            ->setParameter('status', 'active');
        $queryBuilder->andWhere('p.price >= :minPrice')
            ->setParameter('minPrice', $minPrice);
        $queryBuilder->andWhere('p.price <= :maxPrice')
            ->setParameter('maxPrice', $maxPrice);
        $queryBuilder->andWhere('p.seller = :seller')
            ->setParameter('seller', $seller);
        $queryBuilder->andWhere('p.category = :category')
            ->setParameter('category', $category);
        $queryBuilder->orderBy('p.created_at', $order);

        return $queryBuilder->getQuery()->getResult();
    }

    public function findOneById(int $id): array
    {
        $queryBuilder = $this->createQueryBuilder('p');

        $queryBuilder->Where('p.id = :id')
            ->setParameter('id', $id);

        return $queryBuilder->getQuery()->getResult();
    }

    //    /**
    //     * @return Product[] Returns an array of Product objects
    //     */
    //    public function findByExampleField($value): array
    //    {
    //        return $this->createQueryBuilder('p')
    //            ->andWhere('p.exampleField = :val')
    //            ->setParameter('val', $value)
    //            ->orderBy('p.id', 'ASC')
    //            ->setMaxResults(10)
    //            ->getQuery()
    //            ->getResult()
    //        ;
    //    }

    //    public function findOneBySomeField($value): ?Product
    //    {
    //        return $this->createQueryBuilder('p')
    //            ->andWhere('p.exampleField = :val')
    //            ->setParameter('val', $value)
    //            ->getQuery()
    //            ->getOneOrNullResult()
    //        ;
    //    }
}
