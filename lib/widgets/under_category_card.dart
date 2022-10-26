import 'package:flutter/material.dart';

class UnderCategoryCard extends StatelessWidget {
  final String nameUnderCategory;
  final String picturesUnderCategory;

  const UnderCategoryCard({super.key, 
    required this.nameUnderCategory,
    required this.picturesUnderCategory,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(4),
          width: MediaQuery.of(context).size.width * 0.90,
          height: MediaQuery.of(context).size.height * 0.30,
          child: Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.35,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.26,
                      height: MediaQuery.of(context).size.height * 0.14,
                      child: Text(
                        nameUnderCategory,
                        style: const TextStyle(
                          fontSize: 24,
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.08,
                      alignment: AlignmentDirectional.bottomStart,
                      child: Row(
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Row(
                              children: const [
                                Text(
                                  'Shop now',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF0ACF83),
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Icon(
                                  Icons.arrow_circle_right_outlined,
                                  color: Color(0xFF0ACF83),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  picturesUnderCategory,
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.32,
                  fit: BoxFit.cover,
                  scale: 0.8,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
