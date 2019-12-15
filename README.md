# Movie 6 Code Test

I recently received a code test when I was looking for a job. I was using iOS native to develop, but I learn flutter recently, so I ended up choose flutter.

## Requirements

According to requirements, I need to complete three views

| Movie List (Grid) | Movie List (List)  |  Movie List (Movie Detail) |
|---|---|---|
| ![-](./media/15763788539941.jpg)| ![](./media/15763788656023.jpg)|  ![](./media/15763788746730.jpg)|

## Site Map
![flo](./media/flow.png)


1. The outermost layer is `BottomNavigation` which is `UITabBarController` in iOS.
2. The second tab is **Movie List page**, other page is Empty page.
3. **Movie List page** have two display modes, user can click switch button to switch mode
    1. Grid View (UICollectionView)
    2. List View (UITableViewController)
4. When user click Grid or List cell, will navigate to **Movie Detail page**
5. Top of **Movie Detail page** have swiper to display video preview or image


-------

## Architecture 
```shell
lib
 ├── main.dart
 ├── api
 │   ├── movie6_api.dart
 │   └── network.dart
 ├── models
 │   ├── swiperModel.dart
 │   └── movies.dart
 ├── widgets
 │   ├── Movie_ListItem.dart
 │   ├── Component.dart
 │   └── Movie_GridItem.dart
 └── pages
     ├── MovieDetail.dart
     ├── MovieList.dart
     └── EmptyPage.dart
```

Because this is my first time using flutter, so I just use the simplest and original way, did not try tools like state management such as BLoC Architecture and Provider, but I think if want to continue to complete the app It is necessary to use state management.

-------

## Problems of developing

### json to model 

API return information is more complicated, I do n’t want to enter it manually and there are keys using **Chinese** characters.

![-w839](media/15764007977557.jpg)

#### Solution

I have tried mainstream solution like [json_serializable](https://flutter.dev/docs/development/data-and-backend/json), [JSON to Dart](https://javiercbk.github.io/json_to_dart/) to help me convert json to model easily, but there is a problem:

1. since json have **Chinese** characters, tool cannot recognized correctly
2. Cannot find relation of the column, eg: `infoDict.Category` there are actually 5 types`IIB, IIA, TBC, I, III `, should use datatype `Empty`, but the tool Identified as `String` 


I finally found [Paste JSON as Code • quicktype](https://apps.apple.com/hk/app/paste-json-as-code-quicktype/id1330801220?mt=12), it solve the above problems well, i only need modify chinese key to english.

![-w597](./media/15764024418998.jpg)
![-w424](./media/15764024503228.jpg)


-------

### Video thumbnail in Movie detail 

Top of  Movie detail page, i need show video thumbnail and image in swiper.
In API result image url is `screenShots`, video is `multitrailers`
![-w1031](./media/15764032357875.jpg)

So, i need use `multitrailers` youtube url get video thumbnail.

#### Solution

[How do I get a YouTube video thumbnail from the YouTube API?](https://stackoverflow.com/questions/2068344/how-do-i-get-a-youtube-video-thumbnail-from-the-youtube-api)

According to stackoverflow, I need to extract the `youtube id` from the url and fill `youtube id` in this format url. `https://img.youtube.com/vi/<insert-youtube-video-id-here>/0.jpg`

[How do I get the YouTube video ID from a URL?](https://stackoverflow.com/q/3452546/5588637)

I using Regex to extract the `youtube id`

-------

## Screenshot

![IMG_8677](media/IMG_8677.jpeg)

## Demo

https://www.youtube.com/watch?v=4nuEnG_67WM
