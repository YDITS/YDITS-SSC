//
// YDITS for SSC
//
// Copyright (C) よね/Yone
//
// https://github.com/YDITS/YDITS-SSC
//

/// 日本の都道府県の列挙
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

/// 日本の都道府県
abstract final class JapanPrefectures {
  /// 日本の都道府県Enumから都道府県文字列（末尾に都道府県を付与したもの）に変換するMap
  static final Map<JapanPrefecturesEnum, String> enumToString = {
    JapanPrefecturesEnum.hokkaido: "北海道",
    JapanPrefecturesEnum.aomori: "青森県",
    JapanPrefecturesEnum.iwate: "岩手県",
    JapanPrefecturesEnum.miyagi: "宮城県",
    JapanPrefecturesEnum.akita: "秋田県",
    JapanPrefecturesEnum.yamagata: "山形県",
    JapanPrefecturesEnum.fukushima: "福島県",
    JapanPrefecturesEnum.ibaraki: "茨城県",
    JapanPrefecturesEnum.tochigi: "栃木県",
    JapanPrefecturesEnum.gunma: "群馬県",
    JapanPrefecturesEnum.saitama: "埼玉県",
    JapanPrefecturesEnum.chiba: "千葉県",
    JapanPrefecturesEnum.tokyo: "東京都",
    JapanPrefecturesEnum.kanagawa: "神奈川県",
    JapanPrefecturesEnum.niigata: "新潟県",
    JapanPrefecturesEnum.toyama: "富山県",
    JapanPrefecturesEnum.ishikawa: "石川県",
    JapanPrefecturesEnum.hukui: "福井県",
    JapanPrefecturesEnum.yamanashi: "山梨県",
    JapanPrefecturesEnum.nagano: "長野県",
    JapanPrefecturesEnum.gifu: "岐阜県",
    JapanPrefecturesEnum.shizuoka: "静岡県",
    JapanPrefecturesEnum.aichi: "愛知県",
    JapanPrefecturesEnum.mie: "三重県",
    JapanPrefecturesEnum.shiga: "滋賀県",
    JapanPrefecturesEnum.kyoto: "京都府",
    JapanPrefecturesEnum.osaka: "大阪府",
    JapanPrefecturesEnum.hyogo: "兵庫県",
    JapanPrefecturesEnum.nara: "奈良県",
    JapanPrefecturesEnum.wakayama: "和歌山県",
    JapanPrefecturesEnum.tottori: "鳥取県",
    JapanPrefecturesEnum.shimane: "島根県",
    JapanPrefecturesEnum.okayama: "岡山県",
    JapanPrefecturesEnum.hiroshima: "広島県",
    JapanPrefecturesEnum.yamaguchi: "山口県",
    JapanPrefecturesEnum.tokushima: "徳島県",
    JapanPrefecturesEnum.kagawa: "香川県",
    JapanPrefecturesEnum.ehime: "愛媛県",
    JapanPrefecturesEnum.kouchi: "高知県",
    JapanPrefecturesEnum.fukuoka: "福岡県",
    JapanPrefecturesEnum.saga: "佐賀県",
    JapanPrefecturesEnum.nagasaki: "長崎県",
    JapanPrefecturesEnum.kumamoto: "熊本県",
    JapanPrefecturesEnum.oita: "大分県",
    JapanPrefecturesEnum.miyazaki: "宮崎県",
    JapanPrefecturesEnum.kagoshima: "鹿児島県",
    JapanPrefecturesEnum.okinawa: "沖縄県",
  };

  /// 都道府県文字列（末尾に都道府県を付与したもの）のリスト
  static final List<String> stringList = enumToString.values.toList();

  /// 都道府県文字列（末尾に都道府県を付与したもの）からEnumに変換するMap
  static final stringToEnum = JapanPrefectures.enumToString.reversed();
}

extension MapReverse<K, V> on Map<K, V> {
  Map<V, K> reversed() => map((k, v) => MapEntry(v, k));
}
