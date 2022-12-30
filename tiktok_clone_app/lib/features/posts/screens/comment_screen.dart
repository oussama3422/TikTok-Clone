import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone_app/core/constants/constants.dart';
import 'package:tiktok_clone_app/core/utils/utils.dart';
import 'package:tiktok_clone_app/features/posts/controller/video_posts_controller.dart';
import 'package:tiktok_clone_app/models/comment.dart';
import '../../../common/loader.dart';
import 'package:timeago/timeago.dart' as tago;

class CommentScreen extends ConsumerStatefulWidget {
 final String id;
  static const routeName='/comment-screen';
  const CommentScreen({super.key,required this.id});

  @override
  ConsumerState<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends ConsumerState<CommentScreen> {
  TextEditingController commentController=TextEditingController();


 addComment(BuildContext context,WidgetRef ref){
     if(commentController.text.trim().isNotEmpty){
        ref.read(videoPostsControllerProvider).postComment(context,commentController.text.trim(),ref,widget.id);
     }else{
      showSnackBar(context, 'fill the field');
     }
 }
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      body:SingleChildScrollView(
        child:SizedBox(
          height:size.height,
          width:size.width,
        child:Column(
          children: [
            Expanded(
              child: StreamBuilder<List<Comment>>(
                stream: ref.read(videoPostsControllerProvider).getCommentsOfPostById(widget.id),
                builder: (context, snapshot) {
                  if(snapshot.connectionState==ConnectionState.waiting){
                      return const Loader();
                  }
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context,index){
                         var comment=snapshot.data![index];
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundColor: backgroundColor,
                              backgroundImage: NetworkImage(comment.profilePhoto),
                            ),
                            title:Row(
                              children: [
                              Text(
                                '${comment.username} ',
                                style: TextStyle(
                                  fontSize:20,
                                  fontWeight:FontWeight.w700,
                                  color:btnClr
                                  )
                                  ),
                              Text(
                                comment.commt,
                                style: TextStyle(
                                  fontSize:20,
                                  fontWeight:FontWeight.w700,
                                  color:btnClr
                                  ),
                                  ),
                            ]
                            ),
                            subtitle: Row(
                              children: [
                              Text(
                                tago.format(comment.dataPublished.toDate()),
                                style:const TextStyle(
                                  fontSize:12,
                                  fontWeight:FontWeight.w700,
                                  color:whiteColor
                                  ),
                              ),
                              const SizedBox(width:10),
                              Text(
                                '${comment.likes.length} likes',
                                style:const TextStyle(
                                  fontSize:12,
                                  fontWeight:FontWeight.w700,
                                  color:whiteColor
                                  ),
                                  ),
                              
                              ],
                              ),
                            trailing: InkWell(
                              child: Icon(
                                Icons.favorite,
                                size:25,
                                color: btnClr,
                                ),
                                ),
                          );
                        }
                      );
                }
              )
              ),
              const Divider(),
              ListTile(
              title: TextFormField(
                controller: commentController,
                style:const TextStyle(fontSize: 16,color:whiteColor),
                decoration:  InputDecoration(
                  labelText: 'Comment',
                  labelStyle:const TextStyle(
                    fontSize: 20,
                    color:whiteColor,
                    fontWeight: FontWeight.w700,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: btnClr!),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: btnClr!)
                  )
                ),
              ),
              trailing: TextButton(
                onPressed:()=>addComment(context,ref),
                child:const Text('Send',style:TextStyle(fontSize: 16,color: Colors.white))
                ),
              )
            ],
        )
        ),
      ),
    );
  }
}