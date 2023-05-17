import 'package:flutter/material.dart';

class ServiceWidget2 extends StatefulWidget {
  const ServiceWidget2({super.key});

  @override
  State<ServiceWidget2> createState() => _ServiceWidget2State();
}

class _ServiceWidget2State extends State<ServiceWidget2> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.only(left: 10),
      child: Row(
        children: [
          BuildCard(
            url:
                'https://images.pexels.com/photos/11568790/pexels-photo-11568790.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
          ),
          BuildCard(
            url:
                'https://images.pexels.com/photos/11519066/pexels-photo-11519066.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
          ),
          BuildCard(
            url:
                'https://images.pexels.com/photos/11568775/pexels-photo-11568775.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
          ),
          BuildCard(
            url:
                'https://images.pexels.com/photos/1251196/pexels-photo-1251196.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
          ),
        ],
      ),
    );
  }
}

class BuildCard extends StatelessWidget {
  const BuildCard({
    super.key,
    required this.url,
  });
  final String url;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 128,
      width: 97.19,
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            url,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
