import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'request_types_record.g.dart';

abstract class RequestTypesRecord
    implements Built<RequestTypesRecord, RequestTypesRecordBuilder> {
  static Serializer<RequestTypesRecord> get serializer =>
      _$requestTypesRecordSerializer;

  @nullable
  String get title;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(RequestTypesRecordBuilder builder) =>
      builder..title = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('request_types');

  static Stream<RequestTypesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<RequestTypesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  RequestTypesRecord._();
  factory RequestTypesRecord(
          [void Function(RequestTypesRecordBuilder) updates]) =
      _$RequestTypesRecord;

  static RequestTypesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createRequestTypesRecordData({
  String title,
}) =>
    serializers.toFirestore(RequestTypesRecord.serializer,
        RequestTypesRecord((r) => r..title = title));
