import 'package:flutter/material.dart';
import 'package:tiktok_clone_app/features/posts/screens/add_video_screen.dart';
import 'package:tiktok_clone_app/features/posts/screens/video_screen.dart';
import 'package:tiktok_clone_app/features/profile/screen/profile_screen.dart';
import '../../features/search/screens/search_screen.dart';
import '../../models/video.dart';

const backgroundColor=Colors.black;
final btnClr=Colors.red[300];
const borderClr=Colors.grey;
const whiteColor=Colors.white;
const balckColor12=Colors.black12;

//pages
var pages=[
  const VideoScreen(),
  SearchScreen(),
  const AddVideoScreen(),
  const Center(child: Text('Message Screen')),
  ProfileScreen(),

];


// List<Video> videosModule=[
//   Video(username: 'T.Ghoush', uid: '1', id: '1', likes: [1000], commentCount: 1, shareCount: 1, songName: 'songName', caption: 'shorts youtube', videoUrl: 'https://www.youtube.com/shorts/eT_GVt5Zx0k', thumbnail: 'listen', profilePhoto: 'https://yt3.ggpht.com/ytc/AMLnZu-hHUmYnfNKnAjG_SdlwPrMy6k0-AyWiu5Yvk7isg=s48-c-k-c0x00ffffff-no-rj'),
//   Video(username: 'T.Ghoush', uid: '2', id: '2', likes: [1000], commentCount: 2, shareCount: 1, songName: 'songName', caption: 'shorts youtube', videoUrl: 'https://www.youtube.com/shorts/eT_GVt5Zx0k', thumbnail: 'listen', profilePhoto: 'https://yt3.ggpht.com/FqiGBOsNpeWbNw20ULboW0jy88JdpqFO9a-YRJ0C2oc4lZ8uoHYJ38PWSkrjdC_zQgNW9pGU=s88-c-k-c0x00ffffff-no-rj'),
//   Video(username: 'T.Ghoush', uid: '3', id: '3', likes: [1000], commentCount:3, shareCount: 1, songName: 'songName', caption: 'shorts youtube', videoUrl: 'https://www.youtube.com/shorts/eT_GVt5Zx0k', thumbnail: 'listen', profilePhoto: 'https://yt3.googleusercontent.com/ytc/AMLnZu9CbDvAG9UbuBroc0pJKRLYW_kq8VtmkQIqs-4Un5U=s88-c-k-c0x00ffffff-no-rj'),
//   Video(username: 'T.Ghoush', uid: '4', id: '4', likes: [1000], commentCount: 4, shareCount: 1, songName: 'songName', caption: 'shorts youtube', videoUrl: 'https://www.youtube.com/shorts/eT_GVt5Zx0k', thumbnail: 'listen', profilePhoto: 'https://media.licdn.com/dms/image/D4E03AQFCU_dYRZ0Oyw/profile-displayphoto-shrink_200_200/0/1665747635914?e=1677715200&v=beta&t=fDzSRdPst2wqbWOScjr3qI8BvP9_7Hat9cH7ubkLhjw'),
//   Video(username: 'T.Ghoush', uid: '5', id: '5', likes: [1000], commentCount: 5, shareCount: 1, songName: 'songName', caption: 'shorts youtube', videoUrl: 'https://www.youtube.com/shorts/eT_GVt5Zx0k', thumbnail: 'listen', profilePhoto: 'https://media.licdn.com/dms/image/D4E16AQEF_V1FDWKSdA/profile-displaybackgroundimage-shrink_350_1400/0/1666129888444?e=1677715200&v=beta&t=LAZ2OvX1LURuMkq3BWmnMVasjmG2-CHLKhWzdGHfT1I'),
//   Video(username: 'T.Ghoush', uid: '6', id: '6', likes: [1000], commentCount: 6, shareCount: 1, songName: 'songName', caption: 'shorts youtube', videoUrl: 'https://www.youtube.com/shorts/eT_GVt5Zx0k', thumbnail: 'listen', profilePhoto: 'https://yt3.ggpht.com/yti/AJo0G0l3yNQ5RlQy7tTQHa28oguJ1gD9YxMWkmbqP24wSw=s88-c-k-c0x00ffffff-no-rj-mo'),
//   Video(username: 'T.Ghoush', uid: '7', id: '7', likes: [1000], commentCount: 7, shareCount: 1, songName: 'songName', caption: 'shorts youtube', videoUrl: 'https://www.youtube.com/shorts/eT_GVt5Zx0k', thumbnail: 'listen', profilePhoto: 'https://yt3.ggpht.com/ytc/AMLnZu-hHUmYnfNKnAjG_SdlwPrMy6k0-AyWiu5Yvk7isg=s48-c-k-c0x00ffffff-no-rj'),
//   Video(username: 'T.Ghoush', uid: '8', id: '8', likes: [1000], commentCount: 8, shareCount: 1, songName: 'songName', caption: 'shorts youtube', videoUrl: 'https://www.youtube.com/shorts/eT_GVt5Zx0k', thumbnail: 'listen', profilePhoto: 'https://yt3.ggpht.com/ytc/AMLnZu-hHUmYnfNKnAjG_SdlwPrMy6k0-AyWiu5Yvk7isg=s48-c-k-c0x00ffffff-no-rj'),
//   Video(username: 'T.Ghoush', uid: '9', id: '9', likes: [1000], commentCount: 9, shareCount: 1, songName: 'songName', caption: 'shorts youtube', videoUrl: 'https://www.youtube.com/shorts/eT_GVt5Zx0k', thumbnail: 'listen', profilePhoto: 'https://yt3.ggpht.com/ytc/AMLnZu-hHUmYnfNKnAjG_SdlwPrMy6k0-AyWiu5Yvk7isg=s48-c-k-c0x00ffffff-no-rj'),
//   Video(username: 'T.Ghoush', uid: '10', id: '10', likes: [1000], commentCount: 10, shareCount: 1, songName: 'songName', caption: 'shorts youtube', videoUrl: 'https://www.youtube.com/shorts/eT_GVt5Zx0k', thumbnail: 'listen', profilePhoto: 'https://yt3.ggpht.com/ytc/AMLnZu-hHUmYnfNKnAjG_SdlwPrMy6k0-AyWiu5Yvk7isg=s48-c-k-c0x00ffffff-no-rj'),
// ];
