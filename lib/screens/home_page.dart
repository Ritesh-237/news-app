import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:news_app/models/news_response_model.dart';

import '../repository/news_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  NewsResponseModel? _newsResponseModel;
  @override
  void initState() {
    super.initState();
    newsResponseData();
  }

  newsResponseData() {
    ApiResponse().newsResponse().then((value) {
      setState(() {
        _newsResponseModel = value;
      });
    }).onError((error, stackTrace) {});
  }

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    if (_newsResponseModel == null) {
      return const Scaffold(
        backgroundColor: Color.fromRGBO(255, 255, 215, 1),
        body: Center(child: CircularProgressIndicator()),
      );
    } else {
      return Scaffold(
        backgroundColor: const Color.fromRGBO(255, 255, 215, 1),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Container(
            color: const Color.fromRGBO(255, 255, 215, 1),
            child: Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 22.0),
                        child: Text(
                          "Home",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 250.0),
                        child: InkWell(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    duration: Duration(seconds: 1),
                                    content: Text("This will Work Soon")));
                          },
                          child: const Icon(
                            Icons.search,
                            color: Colors.black,
                            size: 28,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("This will Work Soon")));
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(left: 18.0),
                          child: Icon(
                            Icons.notifications_none,
                            color: Colors.black,
                            size: 28,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            // Padding(
            //   padding: const EdgeInsets.only(top: 8.0),
            //   child: CarouselSlider(
            //       items: [
            //         Padding(
            //           padding: const EdgeInsets.all(4.0),
            //           child: Container(
            //             decoration: BoxDecoration(
            //                 border: Border.all(color: Colors.black),
            //                 borderRadius:
            //                     const BorderRadius.all(Radius.circular(10))),
            //             child: Image.network(
            //               "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS7l-DhWdraiv3euef8GsOoTyQYAFiHNGnRal11U66WEg&s",
            //               // fit: BoxFit.cover,
            //             ),
            //           ),
            //         ),
            //         Padding(
            //           padding: const EdgeInsets.all(4.0),
            //           child: Container(
            //             decoration: BoxDecoration(
            //                 border: Border.all(color: Colors.black),
            //                 borderRadius:
            //                     const BorderRadius.all(Radius.circular(10))),
            //             child: Image.network(
            //               "https://i.pinimg.com/736x/01/65/af/0165af93ade89ee4d9cd2246c6b1d95b.jpg",
            //               // fit: BoxFit.cover,
            //             ),
            //           ),
            //         ),
            //         Padding(
            //           padding: const EdgeInsets.all(4.0),
            //           child: Container(
            //             decoration: BoxDecoration(
            //                 border: Border.all(color: Colors.black),
            //                 borderRadius:
            //                     const BorderRadius.all(Radius.circular(10))),
            //             child: Image.network(
            //               "https://marketplace.canva.com/EAFHYM9J3As/1/0/1600w/canva-red-minimalist-news-promotion-youtube-thumbnail-3XgO5sUVo98.jpg",
            //               // fit: BoxFit.cover,
            //             ),
            //           ),
            //         )
            //       ],
            //       options: CarouselOptions(
            //           autoPlayAnimationDuration: const Duration(seconds: 1),
            //           autoPlay: true,
            //           scrollPhysics: const BouncingScrollPhysics(),
            //           scrollDirection: Axis.horizontal)),
            // ),
            const DefaultTabController(
                length: 4,
                child: TabBar(
                  // controller: tabController,
                  isScrollable: false,
                  unselectedLabelColor: Colors.black,
                  labelColor: Colors.black,
                  indicatorColor: Colors.black,
                  labelPadding: EdgeInsets.symmetric(vertical: 10.0),
                  tabs: [
                    Text(
                      'Latest  ',
                      style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "For You",
                      style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Popular ',
                      style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "Trending",
                      style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                )),
            const SizedBox(
              height: 10,
            ),

            const Divider(
              thickness: 1,
              color: Color.fromARGB(255, 177, 177, 177),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                // shrinkWrap: true,
                scrollDirection: Axis.vertical,
                // physics: const NeverScrollableScrollPhysics(),
                itemCount: _newsResponseModel?.articles.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          // height: 470,
                          // width: 100,
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(255, 255, 215, 1),
                            // border: Border.all(
                            //     color: const Color.fromARGB(255, 208, 205, 205)),
                            // borderRadius:
                            //     const BorderRadius.all(Radius.circular(10))
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15.0, top: 10),
                                child: Text(
                                  "- ${_newsResponseModel!.articles[index].source.name}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Text(
                                  "---------  ${_newsResponseModel?.articles[index].title}",
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              if (_newsResponseModel!
                                      .articles[index].urlToImage !=
                                  null)
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, right: 8),
                                  child: Container(
                                      height: 230,
                                      width: 370,
                                      decoration: const BoxDecoration(
                                          color: Colors.white),
                                      child: Image.network(_newsResponseModel!
                                          .articles[index].urlToImage
                                          .toString())),
                                )
                              else
                                Container(
                                    alignment: Alignment.center,
                                    height: 230,
                                    width: 370,
                                    child: Image.network(
                                        "https://s.france24.com/media/display/e6279b3c-db08-11ee-b7f5-005056bf30b7/w:1280/p:16x9/news_en_1920x1080.jpg")),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 10.0, left: 10),
                                child: Center(
                                    child: Text(
                                  _newsResponseModel
                                          ?.articles[index].description ??
                                      'Go To The Website To Read The Full Description !',
                                )),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(top: 10.0, left: 8),
                                    child: LikeButton(
                                      animationDuration: Duration(seconds: 1),
                                    ),
                                  ),
                                  if (_newsResponseModel
                                          ?.articles[index].author !=
                                      null)
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 10.0, top: 10),
                                      child: Text(
                                        "--- '${_newsResponseModel?.articles[index].author}'",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  else
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(right: 10.0, top: 10),
                                      child: Text(
                                        "--- anonymous",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 1,
                        color: Color.fromARGB(255, 177, 177, 177),
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      );
    }
  }
}
