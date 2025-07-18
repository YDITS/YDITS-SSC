//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

/// An enumeration of all prefectures in Japan.
enum JapanPrefecturesEnum {
  hokkaido,
  aomori,
  iwate,
  miyagi,
  akita,
  yamagata,
  fukushima,
  ibaraki,
  tochigi,
  gunma,
  saitama,
  chiba,
  tokyo,
  kanagawa,
  niigata,
  toyama,
  ishikawa,
  hukui,
  yamanashi,
  nagano,
  gifu,
  shizuoka,
  aichi,
  mie,
  shiga,
  kyoto,
  osaka,
  hyogo,
  nara,
  wakayama,
  tottori,
  shimane,
  okayama,
  hiroshima,
  yamaguchi,
  tokushima,
  kagawa,
  ehime,
  kouchi,
  fukuoka,
  saga,
  nagasaki,
  kumamoto,
  oita,
  miyazaki,
  kagoshima,
  okinawa,
}

/// A utility class for handling Japanese prefectures.
abstract final class JapanPrefectures {
  /// A map that converts a [JapanPrefecturesEnum] to its corresponding string representation.
  static final Map<JapanPrefecturesEnum, String> enumToString =
      <JapanPrefecturesEnum, String>{
        JapanPrefecturesEnum.hokkaido: '北海道',
        JapanPrefecturesEnum.aomori: '青森県',
        JapanPrefecturesEnum.iwate: '岩手県',
        JapanPrefecturesEnum.miyagi: '宮城県',
        JapanPrefecturesEnum.akita: '秋田県',
        JapanPrefecturesEnum.yamagata: '山形県',
        JapanPrefecturesEnum.fukushima: '福島県',
        JapanPrefecturesEnum.ibaraki: '茨城県',
        JapanPrefecturesEnum.tochigi: '栃木県',
        JapanPrefecturesEnum.gunma: '群馬県',
        JapanPrefecturesEnum.saitama: '埼玉県',
        JapanPrefecturesEnum.chiba: '千葉県',
        JapanPrefecturesEnum.tokyo: '東京都',
        JapanPrefecturesEnum.kanagawa: '神奈川県',
        JapanPrefecturesEnum.niigata: '新潟県',
        JapanPrefecturesEnum.toyama: '富山県',
        JapanPrefecturesEnum.ishikawa: '石川県',
        JapanPrefecturesEnum.hukui: '福井県',
        JapanPrefecturesEnum.yamanashi: '山梨県',
        JapanPrefecturesEnum.nagano: '長野県',
        JapanPrefecturesEnum.gifu: '岐阜県',
        JapanPrefecturesEnum.shizuoka: '静岡県',
        JapanPrefecturesEnum.aichi: '愛知県',
        JapanPrefecturesEnum.mie: '三重県',
        JapanPrefecturesEnum.shiga: '滋賀県',
        JapanPrefecturesEnum.kyoto: '京都府',
        JapanPrefecturesEnum.osaka: '大阪府',
        JapanPrefecturesEnum.hyogo: '兵庫県',
        JapanPrefecturesEnum.nara: '奈良県',
        JapanPrefecturesEnum.wakayama: '和歌山県',
        JapanPrefecturesEnum.tottori: '鳥取県',
        JapanPrefecturesEnum.shimane: '島根県',
        JapanPrefecturesEnum.okayama: '岡山県',
        JapanPrefecturesEnum.hiroshima: '広島県',
        JapanPrefecturesEnum.yamaguchi: '山口県',
        JapanPrefecturesEnum.tokushima: '徳島県',
        JapanPrefecturesEnum.kagawa: '香川県',
        JapanPrefecturesEnum.ehime: '愛媛県',
        JapanPrefecturesEnum.kouchi: '高知県',
        JapanPrefecturesEnum.fukuoka: '福岡県',
        JapanPrefecturesEnum.saga: '佐賀県',
        JapanPrefecturesEnum.nagasaki: '長崎県',
        JapanPrefecturesEnum.kumamoto: '熊本県',
        JapanPrefecturesEnum.oita: '大分県',
        JapanPrefecturesEnum.miyazaki: '宮崎県',
        JapanPrefecturesEnum.kagoshima: '鹿児島県',
        JapanPrefecturesEnum.okinawa: '沖縄県',
      };

  /// A list of all Japanese prefectures as strings.
  static final List<String> stringList = enumToString.values.toList();

  /// A map that converts a string representation of a prefecture back to its [JapanPrefecturesEnum].
  static final Map<String, JapanPrefecturesEnum> stringToEnum =
      JapanPrefectures.enumToString.reversed();
}

/// An extension on [Map] to provide a reversed view of the map.
extension MapReverse<K, V> on Map<K, V> {
  /// Returns a new map with the keys and values swapped.
  Map<V, K> reversed() => map((K k, V v) => MapEntry<V, K>(v, k));
}
