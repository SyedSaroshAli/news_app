import 'package:news_app/models/categories_model.dart';

List<CategoryModel> getCategories(){
  List <CategoryModel> category = [];
  CategoryModel categoryModel = CategoryModel();

  categoryModel.categoryName= 'Business';
  categoryModel.image= 'assets/business.jpg';
  category.add(categoryModel);
  categoryModel = CategoryModel();

  categoryModel.categoryName= 'Entertainment';
  categoryModel.image= 'assets/entertainment.jpg';
  category.add(categoryModel);
  categoryModel = CategoryModel();

  categoryModel.categoryName= 'Health';
  categoryModel.image= 'assets/health.jpg';
  category.add(categoryModel);
  categoryModel = CategoryModel();

  categoryModel.categoryName= 'Science';
  categoryModel.image= 'assets/science.jpeg';
  category.add(categoryModel);
  categoryModel = CategoryModel();

  categoryModel.categoryName= 'General';
  categoryModel.image= 'assets/general.jpeg';
  category.add(categoryModel);
  categoryModel = CategoryModel();
  return category;
}