class Category {
    List<CategoryData> data;

    Category({
        this.data,
    });

    factory Category.fromJson(Map<String, dynamic> json) => new Category(
        data: new List<CategoryData>.from(json["data"].map((x) => CategoryData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": new List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class CategoryData {
    String section;
    List<CategoryItem> items;
    String sectionTitle;

    CategoryData({
        this.section,
        this.items,
        this.sectionTitle,
    });

    factory CategoryData.fromJson(Map<String, dynamic> json) => new CategoryData(
        section: json["section"],
        items: new List<CategoryItem>.from(json["items"].map((x) => CategoryItem.fromJson(x))),
        sectionTitle: json["section_title"] == null ? null : json["section_title"],
    );

    Map<String, dynamic> toJson() => {
        "section": section,
        "items": new List<dynamic>.from(items.map((x) => x.toJson())),
        "section_title": sectionTitle == null ? null : sectionTitle,
    };
}

class CategoryItem {
    String productName;
    String productImage;
    String link;
    String articleTitle;
    String articleImage;

    CategoryItem({
        this.productName,
        this.productImage,
        this.link,
        this.articleTitle,
        this.articleImage,
    });

    factory CategoryItem.fromJson(Map<String, dynamic> json) => new CategoryItem(
        productName: json["product_name"] == null ? null : json["product_name"],
        productImage: json["product_image"] == null ? null : json["product_image"],
        link: json["link"],
        articleTitle: json["article_title"] == null ? null : json["article_title"],
        articleImage: json["article_image"] == null ? null : json["article_image"],
    );

    Map<String, dynamic> toJson() => {
        "product_name": productName == null ? null : productName,
        "product_image": productImage == null ? null : productImage,
        "link": link,
        "article_title": articleTitle == null ? null : articleTitle,
        "article_image": articleImage == null ? null : articleImage,
    };
}