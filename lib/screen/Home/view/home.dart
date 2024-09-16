import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:reaching_tick_tech/header.dart';
import 'package:reaching_tick_tech/screen/current_location/view/current_location.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late GoogleMapController _controller;
  final CameraPosition _initialCameraPosition = CameraPosition(
    target: LatLng(21.2612361, 72.8492587), // Sydney, Australia as an example
    zoom: 17,
  );

  void _onMapCreated(GoogleMapController controller) {
    _controller = controller;
  }

  Set<Polygon> _polygons = {};

  void _setPolygon() {
    final Polygon polygon = Polygon(
      polygonId: PolygonId('1'),
      visible: true,

      points: <LatLng>[
        LatLng(21.2612361, 72.8492587),
      ],
      strokeWidth: 6, // Outline width
      strokeColor: Colors.red, // Outline color
      fillColor:
          Colors.red.withOpacity(0.15), // Polygon fill color with transparency
    );

    setState(() {
      _polygons.add(polygon);
    });
  }

  @override
  void initState() {
    _setPolygon();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    String currentLocation = "Select Location";
    String destinationLocation = "Select Location";
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            color: Color(0xff00509D),
          ),
        ),
        title: const Text(
          'Location Confirmed',
          style: TextStyle(
            color: Color(0xff00509D),
          ),
        ),
        actions: [
          const CircleAvatar(
            foregroundImage: NetworkImage(
              'https://media.licdn.com/dms/image/C4D03AQFnGun-V_Tplw/profile-displayphoto-shrink_200_200/0/1637666602530?e=2147483647&v=beta&t=PPG6jvY3jHBaLUhddgjkW9ccHlQbEPw4vXaU-F1jJV0',
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: h * 0.03,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Column(
                  children: [
                    Image(
                      image: AssetImage('assets/arrow.png'),
                    ),
                    Image(
                      image: AssetImage('assets/line.png'),
                    ),
                    Image(
                      image: AssetImage('assets/mark.png'),
                    ),
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(const CurrentLocation());
                      },
                      child: Container(
                        height: h * 0.05,
                        width: w * 0.8,
                        padding: const EdgeInsets.only(left: 10),
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(8),
                          ),
                          border: Border.all(
                            color: const Color(0xff00509D),
                          ),
                        ),
                        child: Text(currentLocation),
                      ),
                    ),
                    SizedBox(
                      height: h * 0.03,
                    ),
                    Container(
                      height: h * 0.05,
                      width: w * 0.8,
                      padding: const EdgeInsets.only(left: 10),
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                        border: Border.all(
                          color: const Color(0xff00509D),
                        ),
                      ),
                      child: Text(destinationLocation),
                    ),
                  ],
                ),
                SizedBox(
                  height: h * 0.03,
                ),
              ],
            ),
          ),
          Center(
            child: Container(
              height: h * 0.5,
              width: w * 0.9,
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                child: GoogleMap(
                  initialCameraPosition: _initialCameraPosition,
                  onMapCreated: _onMapCreated,
                  mapType: MapType.normal,
                  markers: {
                    Marker(
                      markerId: MarkerId('init'),
                      position: _initialCameraPosition.target,
                      infoWindow: InfoWindow(
                        title: 'Initial Location',
                      ),
                    ),
                  },
                  polygons: _polygons,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
