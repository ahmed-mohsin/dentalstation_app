// To parse this JSON data, do
//
//     final cities = citiesFromJson(jsonString);

import 'dart:convert';

var gg = [
  {
    "id": "1",
    "governorate_name_ar": "القاهرة",
    "governorate_name_en": "Cairo",
    "cities": [
      {
        "id": "1",
        "governorate_id": "1",
        "city_name_ar": "15 مايو",
        "city_name_en": "15 May"
      },
      {
        "id": "2",
        "governorate_id": "1",
        "city_name_ar": "الازبكية",
        "city_name_en": "Al Azbakeyah"
      },
      {
        "id": "3",
        "governorate_id": "1",
        "city_name_ar": "البساتين",
        "city_name_en": "Al Basatin"
      },
      {
        "id": "4",
        "governorate_id": "1",
        "city_name_ar": "التبين",
        "city_name_en": "Tebin"
      },
      {
        "id": "5",
        "governorate_id": "1",
        "city_name_ar": "الخليفة",
        "city_name_en": "El-Khalifa"
      },
      {
        "id": "6",
        "governorate_id": "1",
        "city_name_ar": "الدراسة",
        "city_name_en": "El darrasa"
      },
      {
        "id": "7",
        "governorate_id": "1",
        "city_name_ar": "الدرب الاحمر",
        "city_name_en": "Aldarb Alahmar"
      },
      {
        "id": "8",
        "governorate_id": "1",
        "city_name_ar": "الزاوية الحمراء",
        "city_name_en": "Zawya al-Hamra"
      },
      {
        "id": "9",
        "governorate_id": "1",
        "city_name_ar": "الزيتون",
        "city_name_en": "El-Zaytoun"
      },
      {
        "id": "10",
        "governorate_id": "1",
        "city_name_ar": "الساحل",
        "city_name_en": "Sahel"
      },
      {
        "id": "11",
        "governorate_id": "1",
        "city_name_ar": "السلام",
        "city_name_en": "El Salam"
      },
      {
        "id": "12",
        "governorate_id": "1",
        "city_name_ar": "السيدة زينب",
        "city_name_en": "Sayeda Zeinab"
      },
      {
        "id": "13",
        "governorate_id": "1",
        "city_name_ar": "الشرابية",
        "city_name_en": "El Sharabeya"
      },
      {
        "id": "14",
        "governorate_id": "1",
        "city_name_ar": "مدينة الشروق",
        "city_name_en": "Shorouk"
      },
      {
        "id": "15",
        "governorate_id": "1",
        "city_name_ar": "الظاهر",
        "city_name_en": "El Daher"
      },
      {
        "id": "16",
        "governorate_id": "1",
        "city_name_ar": "العتبة",
        "city_name_en": "Ataba"
      },
      {
        "id": "17",
        "governorate_id": "1",
        "city_name_ar": "القاهرة الجديدة",
        "city_name_en": "New Cairo"
      },
      {
        "id": "18",
        "governorate_id": "1",
        "city_name_ar": "المرج",
        "city_name_en": "El Marg"
      },
      {
        "id": "19",
        "governorate_id": "1",
        "city_name_ar": "عزبة النخل",
        "city_name_en": "Ezbet el Nakhl"
      },
      {
        "id": "20",
        "governorate_id": "1",
        "city_name_ar": "المطرية",
        "city_name_en": "Matareya"
      },
      {
        "id": "21",
        "governorate_id": "1",
        "city_name_ar": "المعادى",
        "city_name_en": "Maadi"
      },
      {
        "id": "22",
        "governorate_id": "1",
        "city_name_ar": "المعصرة",
        "city_name_en": "Maasara"
      },
      {
        "id": "23",
        "governorate_id": "1",
        "city_name_ar": "المقطم",
        "city_name_en": "Mokattam"
      },
      {
        "id": "24",
        "governorate_id": "1",
        "city_name_ar": "المنيل",
        "city_name_en": "Manyal"
      },
      {
        "id": "25",
        "governorate_id": "1",
        "city_name_ar": "الموسكى",
        "city_name_en": "Mosky"
      },
      {
        "id": "26",
        "governorate_id": "1",
        "city_name_ar": "النزهة",
        "city_name_en": "Nozha"
      },
      {
        "id": "27",
        "governorate_id": "1",
        "city_name_ar": "الوايلى",
        "city_name_en": "Waily"
      },
      {
        "id": "28",
        "governorate_id": "1",
        "city_name_ar": "باب الشعرية",
        "city_name_en": "Bab al-Shereia"
      },
      {
        "id": "29",
        "governorate_id": "1",
        "city_name_ar": "بولاق",
        "city_name_en": "Bolaq"
      },
      {
        "id": "30",
        "governorate_id": "1",
        "city_name_ar": "جاردن سيتى",
        "city_name_en": "Garden City"
      },
      {
        "id": "31",
        "governorate_id": "1",
        "city_name_ar": "حدائق القبة",
        "city_name_en": "Hadayek El-Kobba"
      },
      {
        "id": "32",
        "governorate_id": "1",
        "city_name_ar": "حلوان",
        "city_name_en": "Helwan"
      },
      {
        "id": "33",
        "governorate_id": "1",
        "city_name_ar": "دار السلام",
        "city_name_en": "Dar Al Salam"
      },
      {
        "id": "34",
        "governorate_id": "1",
        "city_name_ar": "شبرا",
        "city_name_en": "Shubra"
      },
      {
        "id": "35",
        "governorate_id": "1",
        "city_name_ar": "طره",
        "city_name_en": "Tura"
      },
      {
        "id": "36",
        "governorate_id": "1",
        "city_name_ar": "عابدين",
        "city_name_en": "Abdeen"
      },
      {
        "id": "37",
        "governorate_id": "1",
        "city_name_ar": "عباسية",
        "city_name_en": "Abaseya"
      },
      {
        "id": "38",
        "governorate_id": "1",
        "city_name_ar": "عين شمس",
        "city_name_en": "Ain Shams"
      },
      {
        "id": "39",
        "governorate_id": "1",
        "city_name_ar": "مدينة نصر",
        "city_name_en": "Nasr City"
      },
      {
        "id": "40",
        "governorate_id": "1",
        "city_name_ar": "مصر الجديدة",
        "city_name_en": "New Heliopolis"
      },
      {
        "id": "41",
        "governorate_id": "1",
        "city_name_ar": "مصر القديمة",
        "city_name_en": "Masr Al Qadima"
      },
      {
        "id": "42",
        "governorate_id": "1",
        "city_name_ar": "منشية ناصر",
        "city_name_en": "Mansheya Nasir"
      },
      {
        "id": "43",
        "governorate_id": "1",
        "city_name_ar": "مدينة بدر",
        "city_name_en": "Badr City"
      },
      {
        "id": "44",
        "governorate_id": "1",
        "city_name_ar": "مدينة العبور",
        "city_name_en": "Obour City"
      },
      {
        "id": "45",
        "governorate_id": "1",
        "city_name_ar": "وسط البلد",
        "city_name_en": "Cairo Downtown"
      },
      {
        "id": "46",
        "governorate_id": "1",
        "city_name_ar": "الزمالك",
        "city_name_en": "Zamalek"
      },
      {
        "id": "47",
        "governorate_id": "1",
        "city_name_ar": "قصر النيل",
        "city_name_en": "Kasr El Nile"
      },
      {
        "id": "48",
        "governorate_id": "1",
        "city_name_ar": "الرحاب",
        "city_name_en": "Rehab"
      },
      {
        "id": "49",
        "governorate_id": "1",
        "city_name_ar": "القطامية",
        "city_name_en": "Katameya"
      },
      {
        "id": "50",
        "governorate_id": "1",
        "city_name_ar": "مدينتي",
        "city_name_en": "Madinty"
      },
      {
        "id": "51",
        "governorate_id": "1",
        "city_name_ar": "روض الفرج",
        "city_name_en": "Rod Alfarag"
      },
      {
        "id": "52",
        "governorate_id": "1",
        "city_name_ar": "شيراتون",
        "city_name_en": "Sheraton"
      },
      {
        "id": "53",
        "governorate_id": "1",
        "city_name_ar": "الجمالية",
        "city_name_en": "El-Gamaleya"
      },
      {
        "id": "54",
        "governorate_id": "1",
        "city_name_ar": "العاشر من رمضان",
        "city_name_en": "10th of Ramadan City"
      },
      {
        "id": "55",
        "governorate_id": "1",
        "city_name_ar": "الحلمية",
        "city_name_en": "Helmeyat Alzaytoun"
      },
      {
        "id": "56",
        "governorate_id": "1",
        "city_name_ar": "النزهة الجديدة",
        "city_name_en": "New Nozha"
      },
      {
        "id": "57",
        "governorate_id": "1",
        "city_name_ar": "العاصمة الإدارية",
        "city_name_en": "Capital New"
      }
    ]
  },
  {
    "id": "2",
    "governorate_name_ar": "الجيزة",
    "governorate_name_en": "Giza",
    "cities": [
      {
        "id": "58",
        "governorate_id": "2",
        "city_name_ar": "الجيزة",
        "city_name_en": "Giza"
      },
      {
        "id": "59",
        "governorate_id": "2",
        "city_name_ar": "السادس من أكتوبر",
        "city_name_en": "Sixth of October"
      },
      {
        "id": "60",
        "governorate_id": "2",
        "city_name_ar": "الشيخ زايد",
        "city_name_en": "Cheikh Zayed"
      },
      {
        "id": "61",
        "governorate_id": "2",
        "city_name_ar": "الحوامدية",
        "city_name_en": "Hawamdiyah"
      },
      {
        "id": "62",
        "governorate_id": "2",
        "city_name_ar": "البدرشين",
        "city_name_en": "Al Badrasheen"
      },
      {
        "id": "63",
        "governorate_id": "2",
        "city_name_ar": "الصف",
        "city_name_en": "Saf"
      },
      {
        "id": "64",
        "governorate_id": "2",
        "city_name_ar": "أطفيح",
        "city_name_en": "Atfih"
      },
      {
        "id": "65",
        "governorate_id": "2",
        "city_name_ar": "العياط",
        "city_name_en": "Al Ayat"
      },
      {
        "id": "66",
        "governorate_id": "2",
        "city_name_ar": "الباويطي",
        "city_name_en": "Al-Bawaiti"
      },
      {
        "id": "67",
        "governorate_id": "2",
        "city_name_ar": "منشأة القناطر",
        "city_name_en": "ManshiyetAl Qanater"
      },
      {
        "id": "68",
        "governorate_id": "2",
        "city_name_ar": "أوسيم",
        "city_name_en": "Oaseem"
      },
      {
        "id": "69",
        "governorate_id": "2",
        "city_name_ar": "كرداسة",
        "city_name_en": "Kerdasa"
      },
      {
        "id": "70",
        "governorate_id": "2",
        "city_name_ar": "أبو النمرس",
        "city_name_en": "Abu Nomros"
      },
      {
        "id": "71",
        "governorate_id": "2",
        "city_name_ar": "كفر غطاطي",
        "city_name_en": "Kafr Ghati"
      },
      {
        "id": "72",
        "governorate_id": "2",
        "city_name_ar": "منشأة البكاري",
        "city_name_en": "Manshiyet Al Bakari"
      },
      {
        "id": "73",
        "governorate_id": "2",
        "city_name_ar": "الدقى",
        "city_name_en": "Dokki"
      },
      {
        "id": "74",
        "governorate_id": "2",
        "city_name_ar": "العجوزة",
        "city_name_en": "Agouza"
      },
      {
        "id": "75",
        "governorate_id": "2",
        "city_name_ar": "الهرم",
        "city_name_en": "Haram"
      },
      {
        "id": "76",
        "governorate_id": "2",
        "city_name_ar": "الوراق",
        "city_name_en": "Warraq"
      },
      {
        "id": "77",
        "governorate_id": "2",
        "city_name_ar": "امبابة",
        "city_name_en": "Imbaba"
      },
      {
        "id": "78",
        "governorate_id": "2",
        "city_name_ar": "بولاق الدكرور",
        "city_name_en": "Boulaq Dakrour"
      },
      {
        "id": "79",
        "governorate_id": "2",
        "city_name_ar": "الواحات البحرية",
        "city_name_en": "Al Wahat Al Baharia"
      },
      {
        "id": "80",
        "governorate_id": "2",
        "city_name_ar": "العمرانية",
        "city_name_en": "Omraneya"
      },
      {
        "id": "81",
        "governorate_id": "2",
        "city_name_ar": "المنيب",
        "city_name_en": "Moneeb"
      },
      {
        "id": "82",
        "governorate_id": "2",
        "city_name_ar": "بين السرايات",
        "city_name_en": "Bin Alsarayat"
      },
      {
        "id": "83",
        "governorate_id": "2",
        "city_name_ar": "الكيت كات",
        "city_name_en": "Kit Kat"
      },
      {
        "id": "84",
        "governorate_id": "2",
        "city_name_ar": "المهندسين",
        "city_name_en": "Mohandessin"
      },
      {
        "id": "85",
        "governorate_id": "2",
        "city_name_ar": "فيصل",
        "city_name_en": "Faisal"
      },
      {
        "id": "86",
        "governorate_id": "2",
        "city_name_ar": "أبو رواش",
        "city_name_en": "Abu Rawash"
      },
      {
        "id": "87",
        "governorate_id": "2",
        "city_name_ar": "حدائق الأهرام",
        "city_name_en": "Hadayek Alahram"
      },
      {
        "id": "88",
        "governorate_id": "2",
        "city_name_ar": "الحرانية",
        "city_name_en": "Haraneya"
      },
      {
        "id": "89",
        "governorate_id": "2",
        "city_name_ar": "حدائق اكتوبر",
        "city_name_en": "Hadayek October"
      },
      {
        "id": "90",
        "governorate_id": "2",
        "city_name_ar": "صفط اللبن",
        "city_name_en": "Saft Allaban"
      },
      {
        "id": "91",
        "governorate_id": "2",
        "city_name_ar": "القرية الذكية",
        "city_name_en": "Smart Village"
      },
      {
        "id": "92",
        "governorate_id": "2",
        "city_name_ar": "ارض اللواء",
        "city_name_en": "Ard Ellwaa"
      }
    ]
  },
  {
    "id": "3",
    "governorate_name_ar": "الأسكندرية",
    "governorate_name_en": "Alexandria",
    "cities": [
      {
        "id": "93",
        "governorate_id": "3",
        "city_name_ar": "ابو قير",
        "city_name_en": "Abu Qir"
      },
      {
        "id": "94",
        "governorate_id": "3",
        "city_name_ar": "الابراهيمية",
        "city_name_en": "Al Ibrahimeyah"
      },
      {
        "id": "95",
        "governorate_id": "3",
        "city_name_ar": "الأزاريطة",
        "city_name_en": "Azarita"
      },
      {
        "id": "96",
        "governorate_id": "3",
        "city_name_ar": "الانفوشى",
        "city_name_en": "Anfoushi"
      },
      {
        "id": "97",
        "governorate_id": "3",
        "city_name_ar": "الدخيلة",
        "city_name_en": "Dekheila"
      },
      {
        "id": "98",
        "governorate_id": "3",
        "city_name_ar": "السيوف",
        "city_name_en": "El Soyof"
      },
      {
        "id": "99",
        "governorate_id": "3",
        "city_name_ar": "العامرية",
        "city_name_en": "Ameria"
      },
      {
        "id": "100",
        "governorate_id": "3",
        "city_name_ar": "اللبان",
        "city_name_en": "El Labban"
      },
      {
        "id": "101",
        "governorate_id": "3",
        "city_name_ar": "المفروزة",
        "city_name_en": "Al Mafrouza"
      },
      {
        "id": "102",
        "governorate_id": "3",
        "city_name_ar": "المنتزه",
        "city_name_en": "El Montaza"
      },
      {
        "id": "103",
        "governorate_id": "3",
        "city_name_ar": "المنشية",
        "city_name_en": "Mansheya"
      },
      {
        "id": "104",
        "governorate_id": "3",
        "city_name_ar": "الناصرية",
        "city_name_en": "Naseria"
      },
      {
        "id": "105",
        "governorate_id": "3",
        "city_name_ar": "امبروزو",
        "city_name_en": "Ambrozo"
      },
      {
        "id": "106",
        "governorate_id": "3",
        "city_name_ar": "باب شرق",
        "city_name_en": "Bab Sharq"
      },
      {
        "id": "107",
        "governorate_id": "3",
        "city_name_ar": "برج العرب",
        "city_name_en": "Bourj Alarab"
      },
      {
        "id": "108",
        "governorate_id": "3",
        "city_name_ar": "ستانلى",
        "city_name_en": "Stanley"
      },
      {
        "id": "109",
        "governorate_id": "3",
        "city_name_ar": "سموحة",
        "city_name_en": "Smouha"
      },
      {
        "id": "110",
        "governorate_id": "3",
        "city_name_ar": "سيدى بشر",
        "city_name_en": "Sidi Bishr"
      },
      {
        "id": "111",
        "governorate_id": "3",
        "city_name_ar": "شدس",
        "city_name_en": "Shads"
      },
      {
        "id": "112",
        "governorate_id": "3",
        "city_name_ar": "غيط العنب",
        "city_name_en": "Gheet Alenab"
      },
      {
        "id": "113",
        "governorate_id": "3",
        "city_name_ar": "فلمينج",
        "city_name_en": "Fleming"
      },
      {
        "id": "114",
        "governorate_id": "3",
        "city_name_ar": "فيكتوريا",
        "city_name_en": "Victoria"
      },
      {
        "id": "115",
        "governorate_id": "3",
        "city_name_ar": "كامب شيزار",
        "city_name_en": "Camp Shizar"
      },
      {
        "id": "116",
        "governorate_id": "3",
        "city_name_ar": "كرموز",
        "city_name_en": "Karmooz"
      },
      {
        "id": "117",
        "governorate_id": "3",
        "city_name_ar": "محطة الرمل",
        "city_name_en": "Mahta Alraml"
      },
      {
        "id": "118",
        "governorate_id": "3",
        "city_name_ar": "مينا البصل",
        "city_name_en": "Mina El-Basal"
      },
      {
        "id": "119",
        "governorate_id": "3",
        "city_name_ar": "العصافرة",
        "city_name_en": "Asafra"
      },
      {
        "id": "120",
        "governorate_id": "3",
        "city_name_ar": "العجمي",
        "city_name_en": "Agamy"
      },
      {
        "id": "121",
        "governorate_id": "3",
        "city_name_ar": "بكوس",
        "city_name_en": "Bakos"
      },
      {
        "id": "122",
        "governorate_id": "3",
        "city_name_ar": "بولكلي",
        "city_name_en": "Boulkly"
      },
      {
        "id": "123",
        "governorate_id": "3",
        "city_name_ar": "كليوباترا",
        "city_name_en": "Cleopatra"
      },
      {
        "id": "124",
        "governorate_id": "3",
        "city_name_ar": "جليم",
        "city_name_en": "Glim"
      },
      {
        "id": "125",
        "governorate_id": "3",
        "city_name_ar": "المعمورة",
        "city_name_en": "Al Mamurah"
      },
      {
        "id": "126",
        "governorate_id": "3",
        "city_name_ar": "المندرة",
        "city_name_en": "Al Mandara"
      },
      {
        "id": "127",
        "governorate_id": "3",
        "city_name_ar": "محرم بك",
        "city_name_en": "Moharam Bek"
      },
      {
        "id": "128",
        "governorate_id": "3",
        "city_name_ar": "الشاطبي",
        "city_name_en": "Elshatby"
      },
      {
        "id": "129",
        "governorate_id": "3",
        "city_name_ar": "سيدي جابر",
        "city_name_en": "Sidi Gaber"
      },
      {
        "id": "130",
        "governorate_id": "3",
        "city_name_ar": "الساحل الشمالي",
        "city_name_en": "North Coast\/sahel"
      },
      {
        "id": "131",
        "governorate_id": "3",
        "city_name_ar": "الحضرة",
        "city_name_en": "Alhadra"
      },
      {
        "id": "132",
        "governorate_id": "3",
        "city_name_ar": "العطارين",
        "city_name_en": "Alattarin"
      },
      {
        "id": "133",
        "governorate_id": "3",
        "city_name_ar": "سيدي كرير",
        "city_name_en": "Sidi Kerir"
      },
      {
        "id": "134",
        "governorate_id": "3",
        "city_name_ar": "الجمرك",
        "city_name_en": "Elgomrok"
      },
      {
        "id": "135",
        "governorate_id": "3",
        "city_name_ar": "المكس",
        "city_name_en": "Al Max"
      },
      {
        "id": "136",
        "governorate_id": "3",
        "city_name_ar": "مارينا",
        "city_name_en": "Marina"
      }
    ]
  },
  {
    "id": "4",
    "governorate_name_ar": "الدقهلية",
    "governorate_name_en": "Dakahlia",
    "cities": [
      {
        "id": "137",
        "governorate_id": "4",
        "city_name_ar": "المنصورة",
        "city_name_en": "Mansoura"
      },
      {
        "id": "138",
        "governorate_id": "4",
        "city_name_ar": "طلخا",
        "city_name_en": "Talkha"
      },
      {
        "id": "139",
        "governorate_id": "4",
        "city_name_ar": "ميت غمر",
        "city_name_en": "Mitt Ghamr"
      },
      {
        "id": "140",
        "governorate_id": "4",
        "city_name_ar": "دكرنس",
        "city_name_en": "Dekernes"
      },
      {
        "id": "141",
        "governorate_id": "4",
        "city_name_ar": "أجا",
        "city_name_en": "Aga"
      },
      {
        "id": "142",
        "governorate_id": "4",
        "city_name_ar": "منية النصر",
        "city_name_en": "Menia El Nasr"
      },
      {
        "id": "143",
        "governorate_id": "4",
        "city_name_ar": "السنبلاوين",
        "city_name_en": "Sinbillawin"
      },
      {
        "id": "144",
        "governorate_id": "4",
        "city_name_ar": "الكردي",
        "city_name_en": "El Kurdi"
      },
      {
        "id": "145",
        "governorate_id": "4",
        "city_name_ar": "بني عبيد",
        "city_name_en": "Bani Ubaid"
      },
      {
        "id": "146",
        "governorate_id": "4",
        "city_name_ar": "المنزلة",
        "city_name_en": "Al Manzala"
      },
      {
        "id": "147",
        "governorate_id": "4",
        "city_name_ar": "تمي الأمديد",
        "city_name_en": "tami al'amdid"
      },
      {
        "id": "148",
        "governorate_id": "4",
        "city_name_ar": "الجمالية",
        "city_name_en": "aljamalia"
      },
      {
        "id": "149",
        "governorate_id": "4",
        "city_name_ar": "شربين",
        "city_name_en": "Sherbin"
      },
      {
        "id": "150",
        "governorate_id": "4",
        "city_name_ar": "المطرية",
        "city_name_en": "Mataria"
      },
      {
        "id": "151",
        "governorate_id": "4",
        "city_name_ar": "بلقاس",
        "city_name_en": "Belqas"
      },
      {
        "id": "152",
        "governorate_id": "4",
        "city_name_ar": "ميت سلسيل",
        "city_name_en": "Meet Salsil"
      },
      {
        "id": "153",
        "governorate_id": "4",
        "city_name_ar": "جمصة",
        "city_name_en": "Gamasa"
      },
      {
        "id": "154",
        "governorate_id": "4",
        "city_name_ar": "محلة دمنة",
        "city_name_en": "Mahalat Damana"
      },
      {
        "id": "155",
        "governorate_id": "4",
        "city_name_ar": "نبروه",
        "city_name_en": "Nabroh"
      }
    ]
  },
  {
    "id": "5",
    "governorate_name_ar": "البحر الأحمر",
    "governorate_name_en": "Red Sea",
    "cities": [
      {
        "id": "156",
        "governorate_id": "5",
        "city_name_ar": "الغردقة",
        "city_name_en": "Hurghada"
      },
      {
        "id": "157",
        "governorate_id": "5",
        "city_name_ar": "رأس غارب",
        "city_name_en": "Ras Ghareb"
      },
      {
        "id": "158",
        "governorate_id": "5",
        "city_name_ar": "سفاجا",
        "city_name_en": "Safaga"
      },
      {
        "id": "159",
        "governorate_id": "5",
        "city_name_ar": "القصير",
        "city_name_en": "El Qusiar"
      },
      {
        "id": "160",
        "governorate_id": "5",
        "city_name_ar": "مرسى علم",
        "city_name_en": "Marsa Alam"
      },
      {
        "id": "161",
        "governorate_id": "5",
        "city_name_ar": "الشلاتين",
        "city_name_en": "Shalatin"
      },
      {
        "id": "162",
        "governorate_id": "5",
        "city_name_ar": "حلايب",
        "city_name_en": "Halaib"
      },
      {
        "id": "163",
        "governorate_id": "5",
        "city_name_ar": "الدهار",
        "city_name_en": "Aldahar"
      }
    ]
  },
  {
    "id": "6",
    "governorate_name_ar": "البحيرة",
    "governorate_name_en": "Beheira",
    "cities": []
  },
  {
    "id": "7",
    "governorate_name_ar": "الفيوم",
    "governorate_name_en": "Fayoum",
    "cities": []
  },
  {
    "id": "8",
    "governorate_name_ar": "الغربية",
    "governorate_name_en": "Gharbiya",
    "cities": []
  },
  {
    "id": "9",
    "governorate_name_ar": "الإسماعلية",
    "governorate_name_en": "Ismailia",
    "cities": []
  },
  {
    "id": "10",
    "governorate_name_ar": "المنوفية",
    "governorate_name_en": "Menofia",
    "cities": []
  },
  {
    "id": "11",
    "governorate_name_ar": "المنيا",
    "governorate_name_en": "Minya",
    "cities": []
  },
  {
    "id": "12",
    "governorate_name_ar": "القليوبية",
    "governorate_name_en": "Qaliubiya",
    "cities": []
  },
  {
    "id": "13",
    "governorate_name_ar": "الوادي الجديد",
    "governorate_name_en": "New Valley",
    "cities": []
  },
  {
    "id": "14",
    "governorate_name_ar": "السويس",
    "governorate_name_en": "Suez",
    "cities": []
  },
  {
    "id": "15",
    "governorate_name_ar": "اسوان",
    "governorate_name_en": "Aswan",
    "cities": []
  },
  {
    "id": "16",
    "governorate_name_ar": "اسيوط",
    "governorate_name_en": "Assiut",
    "cities": []
  },
  {
    "id": "17",
    "governorate_name_ar": "بني سويف",
    "governorate_name_en": "Beni Suef",
    "cities": []
  },
  {
    "id": "18",
    "governorate_name_ar": "بورسعيد",
    "governorate_name_en": "Port Said",
    "cities": []
  },
  {
    "id": "19",
    "governorate_name_ar": "دمياط",
    "governorate_name_en": "Damietta",
    "cities": []
  },
  {
    "id": "20",
    "governorate_name_ar": "الشرقية",
    "governorate_name_en": "Sharkia",
    "cities": []
  },
  {
    "id": "21",
    "governorate_name_ar": "جنوب سيناء",
    "governorate_name_en": "South Sinai",
    "cities": []
  },
  {
    "id": "22",
    "governorate_name_ar": "كفر الشيخ",
    "governorate_name_en": "Kafr Al sheikh",
    "cities": []
  },
  {
    "id": "23",
    "governorate_name_ar": "مطروح",
    "governorate_name_en": "Matrouh",
    "cities": []
  },
  {
    "id": "24",
    "governorate_name_ar": "الأقصر",
    "governorate_name_en": "Luxor",
    "cities": []
  },
  {
    "id": "25",
    "governorate_name_ar": "قنا",
    "governorate_name_en": "Qena",
    "cities": []
  },
  {
    "id": "26",
    "governorate_name_ar": "شمال سيناء",
    "governorate_name_en": "North Sinai",
    "cities": []
  },
  {
    "id": "27",
    "governorate_name_ar": "سوهاج",
    "governorate_name_en": "Sohag",
    "cities": []
  }
];

List<Cities> citiesFromJson(String str) =>
    List<Cities>.from(json.decode(str).map((x) => Cities.fromJson(x)));

String citiesToJson(List<Cities> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Cities {
  Cities({
    this.type,
    this.version,
    this.comment,
    this.name,
    this.database,
    this.data,
  });

  String type;
  String version;
  String comment;
  String name;
  String database;
  List<Datum> data;

  factory Cities.fromJson(Map<String, dynamic> json) => Cities(
        type: json["type"] == null ? null : json["type"],
        version: json["version"] == null ? null : json["version"],
        comment: json["comment"] == null ? null : json["comment"],
        name: json["name"] == null ? null : json["name"],
        database: json["database"] == null ? null : json["database"],
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "type": type == null ? null : type,
        "version": version == null ? null : version,
        "comment": comment == null ? null : comment,
        "name": name == null ? null : name,
        "database": database == null ? null : database,
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.governorateNameAr,
    this.governorateNameEn,
    this.cities,
  });

  String id;
  String governorateNameAr;
  String governorateNameEn;
  List<City> cities;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] == null ? null : json["id"],
        governorateNameAr: json["governorate_name_ar"] == null
            ? null
            : json["governorate_name_ar"],
        governorateNameEn: json["governorate_name_en"] == null
            ? null
            : json["governorate_name_en"],
        cities: json["cities"] == null
            ? null
            : List<City>.from(json["cities"].map((x) => City.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "governorate_name_ar":
            governorateNameAr == null ? null : governorateNameAr,
        "governorate_name_en":
            governorateNameEn == null ? null : governorateNameEn,
        "cities": cities == null
            ? null
            : List<dynamic>.from(cities.map((x) => x.toJson())),
      };
}

class City {
  City({
    this.id,
    this.governorateId,
    this.cityNameAr,
    this.cityNameEn,
  });

  String id;
  String governorateId;
  String cityNameAr;
  String cityNameEn;

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"] == null ? null : json["id"],
        governorateId:
            json["governorate_id"] == null ? null : json["governorate_id"],
        cityNameAr: json["city_name_ar"] == null ? null : json["city_name_ar"],
        cityNameEn: json["city_name_en"] == null ? null : json["city_name_en"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "governorate_id": governorateId == null ? null : governorateId,
        "city_name_ar": cityNameAr == null ? null : cityNameAr,
        "city_name_en": cityNameEn == null ? null : cityNameEn,
      };
}
