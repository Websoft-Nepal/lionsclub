import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
class SkeletonMember extends StatelessWidget {
  const SkeletonMember({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        children: [
          SizedBox(
            height: 150,
            child: ListTile(
              title: Container(
                width: 150,
                height: 16,
                color: Colors.grey[300]!,
              ),
              subtitle: Container(
                width: 100,
                height: 12,
                color: Colors.grey[300]!,
              ),
              leading: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.grey[300]!,
              ),
            ),
          ),
          SizedBox(
            height: 150,
            child: ListTile(
              title: Container(
                width: 150,
                height: 16,
                color: Colors.grey[300]!,
              ),
              subtitle: Container(
                width: 100,
                height: 12,
                color: Colors.grey[300]!,
              ),
              leading: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.grey[300]!,
              ),
            ),
          ),
          SizedBox(
            height: 150,
            child: ListTile(
              title: Container(
                width: 150,
                height: 16,
                color: Colors.grey[300]!,
              ),
              subtitle: Container(
                width: 100,
                height: 12,
                color: Colors.grey[300]!,
              ),
              leading: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.grey[300]!,
              ),
            ),
          ),
          SizedBox(
            height: 150,
            child: ListTile(
              title: Container(
                width: 150,
                height: 16,
                color: Colors.grey[300]!,
              ),
              subtitle: Container(
                width: 100,
                height: 12,
                color: Colors.grey[300]!,
              ),
              leading: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.grey[300]!,
              ),
            ),
          ),
          ListTile(
            title: Container(
              width: 150,
              height: 16,
              color: Colors.grey[300]!,
            ),
            subtitle: Container(
              width: 100,
              height: 12,
              color: Colors.grey[300]!,
            ),
            leading: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.grey[300]!,
            ),
          ),
        ],
      ),
    );
  }
  }

