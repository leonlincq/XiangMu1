*main.m   Ö÷º¯Êı	
    main.h   ´æ·Åmain°üº¬µÄhÎÄ¼ş



*Status.m   ×´Ì¬»ú   Status+Regex.m ÅĞ¶Ï×Ö·ûÊÇ·ñºÏ·¨£¨ÕıÔò±í´ïÊ½£©
¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª¡ª
¼Ì|	
³Ğ|->Ui.m   Ui ¹«ÓÃÀà
     ¼Ì| 
       |->Uimain       UiÖ÷½çÃæÀà
     ³Ğ|->Uisuperuser  Ui³¬¼¶ÓÃ»§Àà
       |->Uicommonuser UiÆÕÍ¨ÓÃ»§Àà



FMDB   µÚÈı·½sqlite²Ù×÷




ÓÃ»§ĞÅÏ¢±í(±í1)£º
Manageuserdatas.m/.h

// ÓÃ»§Ãû | ÃÜÂë | ÕæÃû | ÓÊ¼ş | µç»° | »áÔ± | ÃÜ±£ÎÊÌâ1 | ÃÜ±£´ğ°¸1 | ÃÜ±£ÎÊÌâ2 | ÃÜ±£´ğ°¸2 | ÃÜ±£ÎÊÌâ3 | ÃÜ±£´ğ°¸3 |
@property (nonatomic,copy)      NSString    *name;      //ÓÃ»§Ãû       --¹ØÁª
@property (nonatomic,copy)      NSString    *password;  //ÃÜÂë
@property (nonatomic,copy)      NSString    *realname;  //ÕæÃû
@property (nonatomic,copy)      NSString    *email;     //ÓÊ¼ş
@property (nonatomic,copy)      NSString    *phonenum;  //µç»°
@property (nonatomic,copy)      NSString    *member;    //»áÔ±
@property (nonatomic,copy)      NSString    *question1; //ÃÜ±£ÎÊÌâ1
@property (nonatomic,copy)      NSString    *answer1;   //ÃÜ±£´ğ°¸1
@property (nonatomic,copy)      NSString    *question2; //ÃÜ±£ÎÊÌâ2
@property (nonatomic,copy)      NSString    *answer2;   //ÃÜ±£´ğ°¸2
@property (nonatomic,copy)      NSString    *question3; //ÃÜ±£ÎÊÌâ3
@property (nonatomic,copy)      NSString    *answer3;   //ÃÜ±£´ğ°¸3



ÉÌÆ·Àà±ğ±í(±í2)£º		£¿£¡
Managewares.m/.h

// ·ÖÀà | ÉÌÆ·±àºÅ | ÉÌÆ·Ãû | ½ğ¶î | ÆÀ¼ÛÓÃ»§n | ÆÀ¼Û·ÖÊın | ...
@property (nonatomic,copy)      NSString    *wareclass; //·ÖÀà
@property (nonatomic,copy)      NSString    *warenum;   //ÉÌÆ·±àºÅ
@property (nonatomic,copy)      NSString    *warename;  //ÉÌÆ·Ãû
@property (nonatomic,copy)      NSString    *wareprice; //½ğ¶î
@property (nonatomic,copy)      NSString    *wareuser;  //ÆÀ¼ÛÓÃ»§
@property (nonatomic,copy)      NSString    *warejudge; //ÆÀ¼Û·ÖÊı


ÓÃ»§×Ê½ğ±í(±í3)£º
Managemoney.m/.h

// ÓÃ»§Ãû | ×Ü×Ê½ğ | ×Ê½ğÁ÷Ïò | ²Ù×÷Ê±¼ä |...
@property (nonatomic,copy)  NSString    *name;      //ÓÃ»§Ãû       --¹ØÁª
@property (nonatomic,copy)  NSString    *allmoney;  //×Ü×Ê½ğ
@property (nonatomic,copy)  NSString    *opmoney;   //×Ê½ğÁ÷Ïò (´æ¡¢È¡¡¢×ª)
@property (nonatomic,copy)  NSString    *optime;    //²Ù×÷Ê±¼ä



