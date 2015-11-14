<!---
This library is part of the Common Function Library Project. An open source
	collection of UDF libraries designed for ColdFusion 5.0 and higher. For more information,
	please see the web site at:

		http://www.cflib.org

	Warning:
	You may not need all the functions in this library. If speed
	is _extremely_ important, you may want to consider deleting
	functions you do not plan on using. Normally you should not
	have to worry about the size of the library.

	License:
	This code may be used freely.
	You may modify this code as you see fit, however, this header, and the header
	for the functions must remain intact.

	This code is provided as is.  We make no warranty or guarantee.  Use of this code is at your own risk.
--->

<cfscript>
/**
 * Takes an ISO 669 Two-Letter Language Code (e.g., EN) and returns the Language (e.g., English).
 * 
 * @param code 	 Country code. (Required)
 * @return Returns a string. 
 * @author Stephen Lapointe (stephen@waldenstreet.com) 
 * @version 1, August 10, 2005 
 */
function codeToLanguage(code) {
  var lCode ="AA,AB,AF,AM,AR,AS,AY,AZ,BA,BE,BG,BH,BI,BN,BN,BO,BR,CA,CO,CS,CY,DA,DE,DZ,EL,EN,EN,EN,EO,ES,ET,EU,FA,FI,FJ,FO,FR,FY,GA,GD,GD,GL,GN,GU,HA,HI,HR,HU,HY,IA,IE,IK,IN,IS,IT,IW,JA,JI,JW,KA,KK,KL,KM,KN,KO,KS,KU,KY,LA,LN,LO,LT,LV,LV,MG,MI,MK,ML,MN,MO,MR,MS,MT,MY,NA,NE,NL,NO,OC,OM,OM,OR,PA,PL,PS,PS,PT,QU,RM,RN,RO,RU,RW,SA,SD,SG,SH,SI,SK,SL,SM,SN,SO,SQ,SR,SS,ST,SU,SV,SW,TA,TE,TG,TH,TI,TK,TL,TN,TO,TR,TS,TT,TW,UK,UR,UZ,VI,VO,WO,XH,YO,ZH,ZU";  
  var languages = "Afar,Abkhazian,Afrikaans,Amharic,Arabic,Assamese,Aymara,Azerbaijani,Bashkir,Byelorussian,Bulgarian,Bihari,Bislama,Bengali ,Bangla,Tibetan,Breton,Catalan,Corsican,Czech,Welsh,Danish,German,Bhutani,Greek,English,English (British),English (American),Esperanto,Spanish,Estonian,Basque,Persian,Finnish,Fiji,Faeroese,French,Frisian,Irish,Gaelic,Gaelic (Scots),Galician,Guarani,Gujarati,Hausa,Hindi,Croatian,Hungarian,Armenian,Interlingua,Interlingue,Inupiak,Indonesian,Icelandic,Italian,Hebrew,Japanese,Yiddish,Javanese,Georgian,Kazakh,Greenlandic,Cambodian,Kannada,Korean,Kashmiri,Kurdish,Kirghiz,Latin,Lingala,Laothian,Lithuanian,Latvian ,Lettish,Malagasy,Maori,Macedonian,Malayalam,Mongolian,Moldavian,Marathi,Malay,Maltese,Burmese,Nauru,Nepali,Dutch,Norwegian,Occitan,Oromo,Afan,Oriya,Punjabi,Polish,Pashto ,Pushto,Portuguese,Quechua,Rhaeto-Romance,Kirundi,Romanian,Russian,Kinyarwanda,Sanskrit,Sindhi,Sangro,Serbo-Croatian,Singhalese,Slovak,Slovenian,Samoan,Shona,Somali,Albanian,Serbian,Siswati,Sesotho,Sudanese,Swedish,Swahili,Tamil,Tegulu,Tajik,Thai,Tigrinya,Turkmen,Tagalog,Setswana,Tonga,Turkish,Tsonga,Tatar,Twi,Ukrainian,Urdu,Uzbek,Vietnamese,Volapuk,Wolof,Xhosa,Yoruba,Chinese,Zulu";

  if(listFindNoCase(lCode,code)) return listGetAt(languages,listFindNoCase(lCode,code));
}
</cfscript>