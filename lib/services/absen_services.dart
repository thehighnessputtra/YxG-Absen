import 'package:cloud_firestore/cloud_firestore.dart';

class AbsenServices {
  CollectionReference ref = FirebaseFirestore.instance.collection('absen');

  checkInToFirestore({required String email}) async {
    CollectionReference ref = FirebaseFirestore.instance.collection('absen');

    // Get the current document data
    DocumentSnapshot docSnapshot = await ref.doc(email).get();
    Map? data = docSnapshot.data() as Map?;

    // Initialize arrays if they don't exist or are null
    List dateCheckIn = data?['checkIn']['dateCheckIn'] != null
        ? List.from(data!['checkIn']['dateCheckIn'])
        : [];
    List lat = data?['checkIn']['lat'] != null
        ? List.from(data!['checkIn']['lat'])
        : [];
    List long = data?['checkIn']['long'] != null
        ? List.from(data!['checkIn']['long'])
        : [];

    // Add the new values to the arrays
    dateCheckIn.add(DateTime.now());
    lat.add("latt");
    long.add("long");

    // Update the Firestore document with the updated arrays
    await ref.doc(email).set({
      'status': "checkIn",
      'checkIn': {
        'dateCheckIn': dateCheckIn,
        'lat': lat,
        'long': long,
      },
    }, SetOptions(merge: true));
  }

  checkOutToFirestore({required String email}) async {
    // Get the current document data
    DocumentSnapshot docSnapshot = await ref.doc(email).get();
    Map? data = docSnapshot.data() as Map?;

    // Initialize arrays if they don't exist or are null
    List dateCheckOut = data?['checkOut']['dateCheckOut'] != null
        ? List.from(data!['checkOut']['dateCheckOut'])
        : [];
    List lat = data?['checkOut']['lat'] != null
        ? List.from(data!['checkOut']['lat'])
        : [];
    List long = data?['checkOut']['long'] != null
        ? List.from(data!['checkOut']['long'])
        : [];

    // Add the new values to the arrays
    dateCheckOut.add(DateTime.now());
    lat.add("latt");
    long.add("long");

    // Update the Firestore document with the updated arrays
    await ref.doc(email).set({
      'status': "checkOut",
      'checkOut': {
        'dateCheckOut': dateCheckOut,
        'lat': lat,
        'long': long,
      },
    }, SetOptions(merge: true));
  }
}
