*main.m   ������	
    main.h   ���main������h�ļ�



*Status.m   ״̬��   Status+Regex.m �ж��ַ��Ƿ�Ϸ���������ʽ��
������������������������������������������������������������������������������������������������������������
��|	
��|->Ui.m   Ui�������
     ��| 
       |->Uimain       Ui��������
     ��|->Uisuperuser  Ui�����û���
       |->Uicommonuser Ui��ͨ�û���



FMDB   ������sqlite����




�û���Ϣ��(��1)��
Manageuserdatas.m/.h

// �û��� | ���� | ���� | �ʼ� | �绰 | ��Ա | �ܱ�����1 | �ܱ���1 | �ܱ�����2 | �ܱ���2 | �ܱ�����3 | �ܱ���3 |
@property (nonatomic,copy)      NSString    *name;      //�û���       --����
@property (nonatomic,copy)      NSString    *password;  //����
@property (nonatomic,copy)      NSString    *realname;  //����
@property (nonatomic,copy)      NSString    *email;     //�ʼ�
@property (nonatomic,copy)      NSString    *phonenum;  //�绰
@property (nonatomic,copy)      NSString    *member;    //��Ա
@property (nonatomic,copy)      NSString    *question1; //�ܱ�����1
@property (nonatomic,copy)      NSString    *answer1;   //�ܱ���1
@property (nonatomic,copy)      NSString    *question2; //�ܱ�����2
@property (nonatomic,copy)      NSString    *answer2;   //�ܱ���2
@property (nonatomic,copy)      NSString    *question3; //�ܱ�����3
@property (nonatomic,copy)      NSString    *answer3;   //�ܱ���3



��Ʒ����(��2)��		����
Managewares.m/.h

// ���� | ��Ʒ��� | ��Ʒ�� | ��� | �����û�n | ���۷���n | ...
@property (nonatomic,copy)      NSString    *wareclass; //����
@property (nonatomic,copy)      NSString    *warenum;   //��Ʒ���
@property (nonatomic,copy)      NSString    *warename;  //��Ʒ��
@property (nonatomic,copy)      NSString    *wareprice; //���
@property (nonatomic,copy)      NSString    *wareuser;  //�����û�
@property (nonatomic,copy)      NSString    *warejudge; //���۷���


�û��ʽ��(��3)��
Managemoney.m/.h

// �û��� | ���ʽ� | �ʽ����� | ����ʱ�� |...
@property (nonatomic,copy)  NSString    *name;      //�û���       --����
@property (nonatomic,copy)  NSString    *allmoney;  //���ʽ�
@property (nonatomic,copy)  NSString    *opmoney;   //�ʽ����� (�桢ȡ��ת)
@property (nonatomic,copy)  NSString    *optime;    //����ʱ��



