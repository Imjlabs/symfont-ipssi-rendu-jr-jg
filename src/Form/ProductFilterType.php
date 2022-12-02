<?php

namespace App\Form;

use App\Entity\Product;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\CheckboxType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\OptionsResolver\OptionsResolver;

class ProductFilterType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('price', CheckboxType::class, [
                'label' => 'Prix',
                'required' => false
            ])
            ->add('category', CheckboxType::class, [
                'label' => 'Prix',
                'required' => false
            ])
            ->add('order', ChoiceType::class, [
                'label' => 'Ordre',
                'Croissant' => 'ASC',
                'Décroissant' => 'DESC'
            ]);
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Product::class,
        ]);
    }
}
