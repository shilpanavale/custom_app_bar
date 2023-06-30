library custom_app_bar;

import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget{
  final String? title;
  final Color? backgroundColor;
  final int? index;
  final String? enableSearchBar;
  final String? enableRefreshButton;
  final String? clickFromPage;
  final BuildContext contextForeign;
  final dynamic objPage;
  final bool? flagRefresh;
  final VoidCallback leadingTap;

  const CustomAppBar(
      { Key? key,
        this.title,
        this.enableSearchBar,
        this.enableRefreshButton,
        required this.contextForeign,
        this.clickFromPage,
        this.objPage,
        this.flagRefresh, this.index, this.backgroundColor, required this.leadingTap,
      }): super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(55);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CustomAppBar();
  }
}

class _CustomAppBar extends State<CustomAppBar> {

  Widget appBarTitle = const Text("Religare");
  bool flagRefresh=false;
  Icon actionIcon = const Icon(
    Icons.search,
    size: 20,
  );

  Icon actionIcon2 = const Icon(
    Icons.add,
    size: 20,
  );

  @override
  Widget build(BuildContext context) {
    widget.enableRefreshButton == "ENB_RightArrow"
        ? actionIcon2 = const Icon(
      Icons.arrow_forward_outlined,
      size: 20,
    )
        : widget.enableRefreshButton == "ENB_addtp"
        ? actionIcon2 = const Icon(
      Icons.add,
      size: 20,
    )
        : widget.enableRefreshButton == "ENB_refresh"
        ? actionIcon2 = const Icon(
      Icons.refresh,
      size: 20,
    )
        : widget.enableRefreshButton == "ENB-add"
        ? actionIcon2 = const Icon(
      Icons.add,
      size: 20,
    )
        : widget.enableRefreshButton == "ENB_forward_arrow"
        ? actionIcon2 = const Icon(
      Icons.arrow_forward,
      size: 20,
    )
        : widget.enableRefreshButton == "ENB-tick"
        ? actionIcon2 =  Icon(
      widget.clickFromPage == "OppUpdateCallHistory"
          ? null
          : Icons.done_rounded,
      size: 20,
    )
        : widget.enableRefreshButton == "ENB-mic"
        ? actionIcon2 = const Icon(
      Icons.mic,
      size: 20,
    )
        : widget.enableRefreshButton == "ENB-loc"
        ? actionIcon2 = const Icon(
      Icons.location_on_rounded,
      size: 20,
    )
        : widget.enableRefreshButton == "ENB_3dotscrm"
        ? actionIcon2 = const Icon(
      Icons.more_vert_rounded,
      size: 20,
    )
        : widget.enableRefreshButton == "ENB_edit"
        ? actionIcon2 = const Icon(
      Icons.edit,
      size:
      20,
    )
        : widget.enableRefreshButton == "ENB_clear"
        ? actionIcon2 = const Icon(
      Icons.clear,
      size: 20,
    )

        : actionIcon2 = const Icon(
      Icons.autorenew_rounded,
      size: 20,
    );

    return AppBar(
        backgroundColor: widget.backgroundColor,
        elevation: 3,
        centerTitle: false,
        leading:
        actionIcon.icon == Icons.search
            ? InkWell(
          onTap: widget.leadingTap,
          child: Padding(
            padding: const EdgeInsets.only(left: 8, right: 2),
            child: Container(
              alignment: Alignment.centerLeft,
              child: const Icon(
                Icons.arrow_back_outlined,
                size: 22,
              ),
            ),
          )
        )
            : const SizedBox(
          height: 0,
          width: 0,
        ),
        actions: <Widget>[
          widget.enableSearchBar == 'ENB' && widget.enableRefreshButton == 'ENB'
              ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 30,
                child: IconButton(
                  icon: actionIcon,
                  onPressed: () {
                    setState(() {
                      if (actionIcon.icon == Icons.search) {
                        actionIcon = const Icon(
                          Icons.close,
                          size: 20,
                        );
                        appBarTitle = TextField(
                          autofocus: true,
                          onChanged: (text) {
                            callSearch(text, "SEARCH");
                            widget.objPage.onSearchTextChanged("");
                          },
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                          decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.white,
                                size: 20,
                              ),
                              hintText: " Search",
                              hintStyle:
                              TextStyle(color: Colors.white)),
                        );
                        flagRefresh = false;
                      } else {

                        actionIcon = const Icon(
                          Icons.search,
                          size: 20,
                        );
                        appBarTitle = const Text("AppBar Title");
                        flagRefresh = true;
                      }
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 2),
                child:  IconButton(
                  icon: actionIcon2,
                  onPressed: () {
                    setState(() {});
                  },
                ),
              )
            ],
          )
              : widget.enableSearchBar == 'ENB' || widget.enableSearchBar == 'ENB-R'
              ? IconButton(
            icon: actionIcon,
            onPressed: () {
              setState(() {
                if (actionIcon.icon == Icons.search) {
                  actionIcon = const Icon(
                    Icons.close,
                    size: 20,
                  );
                  appBarTitle = TextField(
                    autofocus: true,
                    onChanged: (text) {
                      callSearch(text, "SEARCH");
                      widget.objPage.onSearchTextChanged("");
                    },
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 20,
                        ),
                        hintText: "Search",
                        hintStyle:
                        TextStyle(color: Colors.white)),
                  );
                } else {

                  callSearch("", "Normal");
                  actionIcon =  const Icon(
                    Icons.search,
                    size: 20,
                  );
                  appBarTitle =  const Text("AppBar Title");
                }
              });
            },
          )
              : widget.enableRefreshButton == 'ENB'
              ?  IconButton(
            icon: actionIcon2,
            onPressed: () {
              setState(() {});
            },
          )
              : widget.enableRefreshButton == 'ENB-mic'
              ?  IconButton(
            icon: actionIcon2,
            onPressed: () {
              setState(() {});
            },
          )
              : widget.enableRefreshButton == 'ENB_RightArrow'
              ?  IconButton(
            icon: actionIcon2,
            onPressed: () {},
          )
              : widget.enableRefreshButton == 'ENB-add'
              ?  IconButton(
            icon: actionIcon2,
            onPressed: () {

            },
          )
              : widget.enableRefreshButton == 'ENB_forward_arrow'
              ?  IconButton(
            icon: actionIcon2,
            onPressed: () {

            },
          )
              : widget.enableRefreshButton == 'ENB-tick'
              ?  IconButton(
            icon: actionIcon2,
            onPressed: () {

            },
          )
              : widget.enableRefreshButton == 'ENB_addtp'
              ?  IconButton(
            icon: actionIcon2,
            onPressed: () {

            },
          )
              : widget.enableRefreshButton == 'ENB_3dotscrm'
              ? IconButton(
            icon: actionIcon2,
            onPressed: () {

            },
          )
              : widget.enableRefreshButton == 'ENB-loc'
              ?  IconButton(
            icon: actionIcon2,
            onPressed: () {
            },
          )
              : widget.enableRefreshButton == 'ENB-map'
              ? IconButton(
            icon: actionIcon2,
            onPressed: () {

            },
          )
              : widget.enableRefreshButton == 'ENB_edit'
              ?  IconButton(
            icon:
            actionIcon2,
            onPressed:
                () {

            },
          )
              : widget.enableRefreshButton == 'ENB_clear'
              ? IconButton(
            icon:
            actionIcon2,
            onPressed:
                () {

            },
          )
              :  widget.enableRefreshButton == 'ENB-cart'
              ? IconButton(
            icon: actionIcon2,
            onPressed:
                () {

            },
          )
              :  widget.enableRefreshButton == 'ENB_refresh'
              ? IconButton(
            icon: actionIcon2,
            onPressed:
                () {
              refreshButtonClick(widget.clickFromPage!);

            },
          )

              : Container(),

        ],

        title: Transform(
            transform: Matrix4.translationValues(-52.0, 0.0, 0.0),
            child: Row(
              children: <Widget>[
                const SizedBox(
                  width: 7,
                ),
                Flexible(
                  child:  Container(
                    width: MediaQuery.of(context).size.width - 100,
                    padding:  const EdgeInsets.only(right: 3.0),
                    child:  Text(
                      "\t\t\t\t\t\t\t${widget.title!}",
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
              ],
            ))
          );
  }

  void callSearch(String text, String callStatus) {
    switch (widget.clickFromPage) {
      case "COMMANPAGE":
        widget.objPage.onSearchTextChangedCommon(text);
        break;
      case "OTHER":
        break;
      default:
        break;
    }
  }
  refreshButtonClick(String specificClick) {
    switch (specificClick) {
      case "DashboardPage":
        widget.objPage.refreshPage();
        break;
      default:
        break;
    }
  }



}