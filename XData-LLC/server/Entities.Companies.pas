unit Entities.Companies;

interface

uses
  SysUtils, 
  Generics.Collections, 
  Aurelius.Mapping.Attributes, 
  Aurelius.Types.Blob, 
  Aurelius.Types.DynamicProperties, 
  Aurelius.Types.Nullable, 
  Aurelius.Types.Proxy, 
  Aurelius.Criteria.Dictionary;

type
  Tcompanies = class;
  TcompaniesTableDictionary = class;
  
  [Entity]
  [Table('companies')]
  [Id('Fid', TIdGenerator.None)]
  Tcompanies = class
  private
    [Column('id', [TColumnProp.Required], 12)]
    Fid: string;
    
    [Column('name', [], 192)]
    Fname: Nullable<string>;
    
    [Column('status', [], 1)]
    Fstatus: Nullable<string>;
    
    [Column('filing_type', [], 15)]
    Ffiling_type: Nullable<string>;
    
    [Column('princ_add_1', [], 42)]
    Fprinc_add_1: Nullable<string>;
    
    [Column('princ_add_2', [], 42)]
    Fprinc_add_2: Nullable<string>;
    
    [Column('princ_city', [], 28)]
    Fprinc_city: Nullable<string>;
    
    [Column('princ_state', [], 2)]
    Fprinc_state: Nullable<string>;
    
    [Column('princ_zip', [], 10)]
    Fprinc_zip: Nullable<string>;
    
    [Column('princ_country', [], 2)]
    Fprinc_country: Nullable<string>;
    
    [Column('mail_add_1', [], 42)]
    Fmail_add_1: Nullable<string>;
    
    [Column('mail_add_2', [], 42)]
    Fmail_add_2: Nullable<string>;
    
    [Column('mail_city', [], 28)]
    Fmail_city: Nullable<string>;
    
    [Column('mail_state', [], 2)]
    Fmail_state: Nullable<string>;
    
    [Column('mail_zip', [], 10)]
    Fmail_zip: Nullable<string>;
    
    [Column('mail_country', [], 2)]
    Fmail_country: Nullable<string>;
    
    [Column('file_date', [], 8)]
    Ffile_date: Nullable<string>;
    
    [Column('fei_number', [], 14)]
    Ffei_number: Nullable<string>;
    
    [Column('more_than_six_off_flag', [], 1)]
    Fmore_than_six_off_flag: Nullable<string>;
    
    [Column('last_trx_date', [], 8)]
    Flast_trx_date: Nullable<string>;
    
    [Column('state_country', [], 2)]
    Fstate_country: Nullable<string>;
    
    [Column('report_year_1', [], 4)]
    Freport_year_1: Nullable<string>;
    
    [Column('house_flag_1', [], 1)]
    Fhouse_flag_1: Nullable<string>;
    
    [Column('report_date_1', [], 8)]
    Freport_date_1: Nullable<string>;
    
    [Column('report_year_2', [], 4)]
    Freport_year_2: Nullable<string>;
    
    [Column('house_flag_2', [], 1)]
    Fhouse_flag_2: Nullable<string>;
    
    [Column('report_date_2', [], 8)]
    Freport_date_2: Nullable<string>;
    
    [Column('report_year_3', [], 4)]
    Freport_year_3: Nullable<string>;
    
    [Column('house_flag_3', [], 1)]
    Fhouse_flag_3: Nullable<string>;
    
    [Column('report_date_3', [], 8)]
    Freport_date_3: Nullable<string>;
    
    [Column('ra_name', [], 42)]
    Fra_name: Nullable<string>;
    
    [Column('ra_name_type', [], 1)]
    Fra_name_type: Nullable<string>;
    
    [Column('ra_add_1', [], 42)]
    Fra_add_1: Nullable<string>;
    
    [Column('ra_city', [], 28)]
    Fra_city: Nullable<string>;
    
    [Column('ra_state', [], 2)]
    Fra_state: Nullable<string>;
    
    [Column('ra_zip5', [], 5)]
    Fra_zip5: Nullable<string>;
    
    [Column('ra_zip4', [], 4)]
    Fra_zip4: Nullable<string>;
    
    [Column('princ1_title', [], 4)]
    Fprinc1_title: Nullable<string>;
    
    [Column('princ1_name_type', [], 1)]
    Fprinc1_name_type: Nullable<string>;
    
    [Column('princ1_name', [], 42)]
    Fprinc1_name: Nullable<string>;
    
    [Column('princ1_add_1', [], 42)]
    Fprinc1_add_1: Nullable<string>;
    
    [Column('princ1_city', [], 28)]
    Fprinc1_city: Nullable<string>;
    
    [Column('princ1_state', [], 2)]
    Fprinc1_state: Nullable<string>;
    
    [Column('princ1_zip5', [], 5)]
    Fprinc1_zip5: Nullable<string>;
    
    [Column('princ1_zip4', [], 4)]
    Fprinc1_zip4: Nullable<string>;
    
    [Column('princ2_title', [], 4)]
    Fprinc2_title: Nullable<string>;
    
    [Column('princ2_name_type', [], 1)]
    Fprinc2_name_type: Nullable<string>;
    
    [Column('princ2_name', [], 42)]
    Fprinc2_name: Nullable<string>;
    
    [Column('princ2_add_1', [], 42)]
    Fprinc2_add_1: Nullable<string>;
    
    [Column('princ2_city', [], 28)]
    Fprinc2_city: Nullable<string>;
    
    [Column('princ2_state', [], 2)]
    Fprinc2_state: Nullable<string>;
    
    [Column('princ2_zip5', [], 5)]
    Fprinc2_zip5: Nullable<string>;
    
    [Column('princ2_zip4', [], 4)]
    Fprinc2_zip4: Nullable<string>;
    
    [Column('princ3_title', [], 4)]
    Fprinc3_title: Nullable<string>;
    
    [Column('princ3_name_type', [], 1)]
    Fprinc3_name_type: Nullable<string>;
    
    [Column('princ3_name', [], 42)]
    Fprinc3_name: Nullable<string>;
    
    [Column('princ3_add_1', [], 42)]
    Fprinc3_add_1: Nullable<string>;
    
    [Column('princ3_city', [], 28)]
    Fprinc3_city: Nullable<string>;
    
    [Column('princ3_state', [], 2)]
    Fprinc3_state: Nullable<string>;
    
    [Column('princ3_zip5', [], 5)]
    Fprinc3_zip5: Nullable<string>;
    
    [Column('princ3_zip4', [], 4)]
    Fprinc3_zip4: Nullable<string>;
    
    [Column('princ4_title', [], 4)]
    Fprinc4_title: Nullable<string>;
    
    [Column('princ4_name_type', [], 1)]
    Fprinc4_name_type: Nullable<string>;
    
    [Column('princ4_name', [], 42)]
    Fprinc4_name: Nullable<string>;
    
    [Column('princ4_add_1', [], 42)]
    Fprinc4_add_1: Nullable<string>;
    
    [Column('princ4_city', [], 28)]
    Fprinc4_city: Nullable<string>;
    
    [Column('princ4_state', [], 2)]
    Fprinc4_state: Nullable<string>;
    
    [Column('princ4_zip5', [], 5)]
    Fprinc4_zip5: Nullable<string>;
    
    [Column('princ4_zip4', [], 4)]
    Fprinc4_zip4: Nullable<string>;
    
    [Column('princ5_title', [], 4)]
    Fprinc5_title: Nullable<string>;
    
    [Column('princ5_name_type', [], 1)]
    Fprinc5_name_type: Nullable<string>;
    
    [Column('princ5_name', [], 42)]
    Fprinc5_name: Nullable<string>;
    
    [Column('princ5_add_1', [], 42)]
    Fprinc5_add_1: Nullable<string>;
    
    [Column('princ5_city', [], 28)]
    Fprinc5_city: Nullable<string>;
    
    [Column('princ5_state', [], 2)]
    Fprinc5_state: Nullable<string>;
    
    [Column('princ5_zip5', [], 5)]
    Fprinc5_zip5: Nullable<string>;
    
    [Column('princ5_zip4', [], 4)]
    Fprinc5_zip4: Nullable<string>;
    
    [Column('princ6_title', [], 4)]
    Fprinc6_title: Nullable<string>;
    
    [Column('princ6_name_type', [], 1)]
    Fprinc6_name_type: Nullable<string>;
    
    [Column('princ6_name', [], 42)]
    Fprinc6_name: Nullable<string>;
    
    [Column('princ6_add_1', [], 42)]
    Fprinc6_add_1: Nullable<string>;
    
    [Column('princ6_city', [], 28)]
    Fprinc6_city: Nullable<string>;
    
    [Column('princ6_state', [], 2)]
    Fprinc6_state: Nullable<string>;
    
    [Column('princ6_zip5', [], 5)]
    Fprinc6_zip5: Nullable<string>;
    
    [Column('princ6_zip4', [], 4)]
    Fprinc6_zip4: Nullable<string>;
  public
    property id: string read Fid write Fid;
    property name: Nullable<string> read Fname write Fname;
    property status: Nullable<string> read Fstatus write Fstatus;
    property filing_type: Nullable<string> read Ffiling_type write Ffiling_type;
    property princ_add_1: Nullable<string> read Fprinc_add_1 write Fprinc_add_1;
    property princ_add_2: Nullable<string> read Fprinc_add_2 write Fprinc_add_2;
    property princ_city: Nullable<string> read Fprinc_city write Fprinc_city;
    property princ_state: Nullable<string> read Fprinc_state write Fprinc_state;
    property princ_zip: Nullable<string> read Fprinc_zip write Fprinc_zip;
    property princ_country: Nullable<string> read Fprinc_country write Fprinc_country;
    property mail_add_1: Nullable<string> read Fmail_add_1 write Fmail_add_1;
    property mail_add_2: Nullable<string> read Fmail_add_2 write Fmail_add_2;
    property mail_city: Nullable<string> read Fmail_city write Fmail_city;
    property mail_state: Nullable<string> read Fmail_state write Fmail_state;
    property mail_zip: Nullable<string> read Fmail_zip write Fmail_zip;
    property mail_country: Nullable<string> read Fmail_country write Fmail_country;
    property file_date: Nullable<string> read Ffile_date write Ffile_date;
    property fei_number: Nullable<string> read Ffei_number write Ffei_number;
    property more_than_six_off_flag: Nullable<string> read Fmore_than_six_off_flag write Fmore_than_six_off_flag;
    property last_trx_date: Nullable<string> read Flast_trx_date write Flast_trx_date;
    property state_country: Nullable<string> read Fstate_country write Fstate_country;
    property report_year_1: Nullable<string> read Freport_year_1 write Freport_year_1;
    property house_flag_1: Nullable<string> read Fhouse_flag_1 write Fhouse_flag_1;
    property report_date_1: Nullable<string> read Freport_date_1 write Freport_date_1;
    property report_year_2: Nullable<string> read Freport_year_2 write Freport_year_2;
    property house_flag_2: Nullable<string> read Fhouse_flag_2 write Fhouse_flag_2;
    property report_date_2: Nullable<string> read Freport_date_2 write Freport_date_2;
    property report_year_3: Nullable<string> read Freport_year_3 write Freport_year_3;
    property house_flag_3: Nullable<string> read Fhouse_flag_3 write Fhouse_flag_3;
    property report_date_3: Nullable<string> read Freport_date_3 write Freport_date_3;
    property ra_name: Nullable<string> read Fra_name write Fra_name;
    property ra_name_type: Nullable<string> read Fra_name_type write Fra_name_type;
    property ra_add_1: Nullable<string> read Fra_add_1 write Fra_add_1;
    property ra_city: Nullable<string> read Fra_city write Fra_city;
    property ra_state: Nullable<string> read Fra_state write Fra_state;
    property ra_zip5: Nullable<string> read Fra_zip5 write Fra_zip5;
    property ra_zip4: Nullable<string> read Fra_zip4 write Fra_zip4;
    property princ1_title: Nullable<string> read Fprinc1_title write Fprinc1_title;
    property princ1_name_type: Nullable<string> read Fprinc1_name_type write Fprinc1_name_type;
    property princ1_name: Nullable<string> read Fprinc1_name write Fprinc1_name;
    property princ1_add_1: Nullable<string> read Fprinc1_add_1 write Fprinc1_add_1;
    property princ1_city: Nullable<string> read Fprinc1_city write Fprinc1_city;
    property princ1_state: Nullable<string> read Fprinc1_state write Fprinc1_state;
    property princ1_zip5: Nullable<string> read Fprinc1_zip5 write Fprinc1_zip5;
    property princ1_zip4: Nullable<string> read Fprinc1_zip4 write Fprinc1_zip4;
    property princ2_title: Nullable<string> read Fprinc2_title write Fprinc2_title;
    property princ2_name_type: Nullable<string> read Fprinc2_name_type write Fprinc2_name_type;
    property princ2_name: Nullable<string> read Fprinc2_name write Fprinc2_name;
    property princ2_add_1: Nullable<string> read Fprinc2_add_1 write Fprinc2_add_1;
    property princ2_city: Nullable<string> read Fprinc2_city write Fprinc2_city;
    property princ2_state: Nullable<string> read Fprinc2_state write Fprinc2_state;
    property princ2_zip5: Nullable<string> read Fprinc2_zip5 write Fprinc2_zip5;
    property princ2_zip4: Nullable<string> read Fprinc2_zip4 write Fprinc2_zip4;
    property princ3_title: Nullable<string> read Fprinc3_title write Fprinc3_title;
    property princ3_name_type: Nullable<string> read Fprinc3_name_type write Fprinc3_name_type;
    property princ3_name: Nullable<string> read Fprinc3_name write Fprinc3_name;
    property princ3_add_1: Nullable<string> read Fprinc3_add_1 write Fprinc3_add_1;
    property princ3_city: Nullable<string> read Fprinc3_city write Fprinc3_city;
    property princ3_state: Nullable<string> read Fprinc3_state write Fprinc3_state;
    property princ3_zip5: Nullable<string> read Fprinc3_zip5 write Fprinc3_zip5;
    property princ3_zip4: Nullable<string> read Fprinc3_zip4 write Fprinc3_zip4;
    property princ4_title: Nullable<string> read Fprinc4_title write Fprinc4_title;
    property princ4_name_type: Nullable<string> read Fprinc4_name_type write Fprinc4_name_type;
    property princ4_name: Nullable<string> read Fprinc4_name write Fprinc4_name;
    property princ4_add_1: Nullable<string> read Fprinc4_add_1 write Fprinc4_add_1;
    property princ4_city: Nullable<string> read Fprinc4_city write Fprinc4_city;
    property princ4_state: Nullable<string> read Fprinc4_state write Fprinc4_state;
    property princ4_zip5: Nullable<string> read Fprinc4_zip5 write Fprinc4_zip5;
    property princ4_zip4: Nullable<string> read Fprinc4_zip4 write Fprinc4_zip4;
    property princ5_title: Nullable<string> read Fprinc5_title write Fprinc5_title;
    property princ5_name_type: Nullable<string> read Fprinc5_name_type write Fprinc5_name_type;
    property princ5_name: Nullable<string> read Fprinc5_name write Fprinc5_name;
    property princ5_add_1: Nullable<string> read Fprinc5_add_1 write Fprinc5_add_1;
    property princ5_city: Nullable<string> read Fprinc5_city write Fprinc5_city;
    property princ5_state: Nullable<string> read Fprinc5_state write Fprinc5_state;
    property princ5_zip5: Nullable<string> read Fprinc5_zip5 write Fprinc5_zip5;
    property princ5_zip4: Nullable<string> read Fprinc5_zip4 write Fprinc5_zip4;
    property princ6_title: Nullable<string> read Fprinc6_title write Fprinc6_title;
    property princ6_name_type: Nullable<string> read Fprinc6_name_type write Fprinc6_name_type;
    property princ6_name: Nullable<string> read Fprinc6_name write Fprinc6_name;
    property princ6_add_1: Nullable<string> read Fprinc6_add_1 write Fprinc6_add_1;
    property princ6_city: Nullable<string> read Fprinc6_city write Fprinc6_city;
    property princ6_state: Nullable<string> read Fprinc6_state write Fprinc6_state;
    property princ6_zip5: Nullable<string> read Fprinc6_zip5 write Fprinc6_zip5;
    property princ6_zip4: Nullable<string> read Fprinc6_zip4 write Fprinc6_zip4;
  end;
  
  TDicDictionary = class
  private
    Fcompanies: TcompaniesTableDictionary;
    function Getcompanies: TcompaniesTableDictionary;
  public
    destructor Destroy; override;
    property companies: TcompaniesTableDictionary read Getcompanies;
  end;
  
  TcompaniesTableDictionary = class
  private
    Fid: TDictionaryAttribute;
    Fname: TDictionaryAttribute;
    Fstatus: TDictionaryAttribute;
    Ffiling_type: TDictionaryAttribute;
    Fprinc_add_1: TDictionaryAttribute;
    Fprinc_add_2: TDictionaryAttribute;
    Fprinc_city: TDictionaryAttribute;
    Fprinc_state: TDictionaryAttribute;
    Fprinc_zip: TDictionaryAttribute;
    Fprinc_country: TDictionaryAttribute;
    Fmail_add_1: TDictionaryAttribute;
    Fmail_add_2: TDictionaryAttribute;
    Fmail_city: TDictionaryAttribute;
    Fmail_state: TDictionaryAttribute;
    Fmail_zip: TDictionaryAttribute;
    Fmail_country: TDictionaryAttribute;
    Ffile_date: TDictionaryAttribute;
    Ffei_number: TDictionaryAttribute;
    Fmore_than_six_off_flag: TDictionaryAttribute;
    Flast_trx_date: TDictionaryAttribute;
    Fstate_country: TDictionaryAttribute;
    Freport_year_1: TDictionaryAttribute;
    Fhouse_flag_1: TDictionaryAttribute;
    Freport_date_1: TDictionaryAttribute;
    Freport_year_2: TDictionaryAttribute;
    Fhouse_flag_2: TDictionaryAttribute;
    Freport_date_2: TDictionaryAttribute;
    Freport_year_3: TDictionaryAttribute;
    Fhouse_flag_3: TDictionaryAttribute;
    Freport_date_3: TDictionaryAttribute;
    Fra_name: TDictionaryAttribute;
    Fra_name_type: TDictionaryAttribute;
    Fra_add_1: TDictionaryAttribute;
    Fra_city: TDictionaryAttribute;
    Fra_state: TDictionaryAttribute;
    Fra_zip5: TDictionaryAttribute;
    Fra_zip4: TDictionaryAttribute;
    Fprinc1_title: TDictionaryAttribute;
    Fprinc1_name_type: TDictionaryAttribute;
    Fprinc1_name: TDictionaryAttribute;
    Fprinc1_add_1: TDictionaryAttribute;
    Fprinc1_city: TDictionaryAttribute;
    Fprinc1_state: TDictionaryAttribute;
    Fprinc1_zip5: TDictionaryAttribute;
    Fprinc1_zip4: TDictionaryAttribute;
    Fprinc2_title: TDictionaryAttribute;
    Fprinc2_name_type: TDictionaryAttribute;
    Fprinc2_name: TDictionaryAttribute;
    Fprinc2_add_1: TDictionaryAttribute;
    Fprinc2_city: TDictionaryAttribute;
    Fprinc2_state: TDictionaryAttribute;
    Fprinc2_zip5: TDictionaryAttribute;
    Fprinc2_zip4: TDictionaryAttribute;
    Fprinc3_title: TDictionaryAttribute;
    Fprinc3_name_type: TDictionaryAttribute;
    Fprinc3_name: TDictionaryAttribute;
    Fprinc3_add_1: TDictionaryAttribute;
    Fprinc3_city: TDictionaryAttribute;
    Fprinc3_state: TDictionaryAttribute;
    Fprinc3_zip5: TDictionaryAttribute;
    Fprinc3_zip4: TDictionaryAttribute;
    Fprinc4_title: TDictionaryAttribute;
    Fprinc4_name_type: TDictionaryAttribute;
    Fprinc4_name: TDictionaryAttribute;
    Fprinc4_add_1: TDictionaryAttribute;
    Fprinc4_city: TDictionaryAttribute;
    Fprinc4_state: TDictionaryAttribute;
    Fprinc4_zip5: TDictionaryAttribute;
    Fprinc4_zip4: TDictionaryAttribute;
    Fprinc5_title: TDictionaryAttribute;
    Fprinc5_name_type: TDictionaryAttribute;
    Fprinc5_name: TDictionaryAttribute;
    Fprinc5_add_1: TDictionaryAttribute;
    Fprinc5_city: TDictionaryAttribute;
    Fprinc5_state: TDictionaryAttribute;
    Fprinc5_zip5: TDictionaryAttribute;
    Fprinc5_zip4: TDictionaryAttribute;
    Fprinc6_title: TDictionaryAttribute;
    Fprinc6_name_type: TDictionaryAttribute;
    Fprinc6_name: TDictionaryAttribute;
    Fprinc6_add_1: TDictionaryAttribute;
    Fprinc6_city: TDictionaryAttribute;
    Fprinc6_state: TDictionaryAttribute;
    Fprinc6_zip5: TDictionaryAttribute;
    Fprinc6_zip4: TDictionaryAttribute;
  public
    constructor Create;
    property id: TDictionaryAttribute read Fid;
    property name: TDictionaryAttribute read Fname;
    property status: TDictionaryAttribute read Fstatus;
    property filing_type: TDictionaryAttribute read Ffiling_type;
    property princ_add_1: TDictionaryAttribute read Fprinc_add_1;
    property princ_add_2: TDictionaryAttribute read Fprinc_add_2;
    property princ_city: TDictionaryAttribute read Fprinc_city;
    property princ_state: TDictionaryAttribute read Fprinc_state;
    property princ_zip: TDictionaryAttribute read Fprinc_zip;
    property princ_country: TDictionaryAttribute read Fprinc_country;
    property mail_add_1: TDictionaryAttribute read Fmail_add_1;
    property mail_add_2: TDictionaryAttribute read Fmail_add_2;
    property mail_city: TDictionaryAttribute read Fmail_city;
    property mail_state: TDictionaryAttribute read Fmail_state;
    property mail_zip: TDictionaryAttribute read Fmail_zip;
    property mail_country: TDictionaryAttribute read Fmail_country;
    property file_date: TDictionaryAttribute read Ffile_date;
    property fei_number: TDictionaryAttribute read Ffei_number;
    property more_than_six_off_flag: TDictionaryAttribute read Fmore_than_six_off_flag;
    property last_trx_date: TDictionaryAttribute read Flast_trx_date;
    property state_country: TDictionaryAttribute read Fstate_country;
    property report_year_1: TDictionaryAttribute read Freport_year_1;
    property house_flag_1: TDictionaryAttribute read Fhouse_flag_1;
    property report_date_1: TDictionaryAttribute read Freport_date_1;
    property report_year_2: TDictionaryAttribute read Freport_year_2;
    property house_flag_2: TDictionaryAttribute read Fhouse_flag_2;
    property report_date_2: TDictionaryAttribute read Freport_date_2;
    property report_year_3: TDictionaryAttribute read Freport_year_3;
    property house_flag_3: TDictionaryAttribute read Fhouse_flag_3;
    property report_date_3: TDictionaryAttribute read Freport_date_3;
    property ra_name: TDictionaryAttribute read Fra_name;
    property ra_name_type: TDictionaryAttribute read Fra_name_type;
    property ra_add_1: TDictionaryAttribute read Fra_add_1;
    property ra_city: TDictionaryAttribute read Fra_city;
    property ra_state: TDictionaryAttribute read Fra_state;
    property ra_zip5: TDictionaryAttribute read Fra_zip5;
    property ra_zip4: TDictionaryAttribute read Fra_zip4;
    property princ1_title: TDictionaryAttribute read Fprinc1_title;
    property princ1_name_type: TDictionaryAttribute read Fprinc1_name_type;
    property princ1_name: TDictionaryAttribute read Fprinc1_name;
    property princ1_add_1: TDictionaryAttribute read Fprinc1_add_1;
    property princ1_city: TDictionaryAttribute read Fprinc1_city;
    property princ1_state: TDictionaryAttribute read Fprinc1_state;
    property princ1_zip5: TDictionaryAttribute read Fprinc1_zip5;
    property princ1_zip4: TDictionaryAttribute read Fprinc1_zip4;
    property princ2_title: TDictionaryAttribute read Fprinc2_title;
    property princ2_name_type: TDictionaryAttribute read Fprinc2_name_type;
    property princ2_name: TDictionaryAttribute read Fprinc2_name;
    property princ2_add_1: TDictionaryAttribute read Fprinc2_add_1;
    property princ2_city: TDictionaryAttribute read Fprinc2_city;
    property princ2_state: TDictionaryAttribute read Fprinc2_state;
    property princ2_zip5: TDictionaryAttribute read Fprinc2_zip5;
    property princ2_zip4: TDictionaryAttribute read Fprinc2_zip4;
    property princ3_title: TDictionaryAttribute read Fprinc3_title;
    property princ3_name_type: TDictionaryAttribute read Fprinc3_name_type;
    property princ3_name: TDictionaryAttribute read Fprinc3_name;
    property princ3_add_1: TDictionaryAttribute read Fprinc3_add_1;
    property princ3_city: TDictionaryAttribute read Fprinc3_city;
    property princ3_state: TDictionaryAttribute read Fprinc3_state;
    property princ3_zip5: TDictionaryAttribute read Fprinc3_zip5;
    property princ3_zip4: TDictionaryAttribute read Fprinc3_zip4;
    property princ4_title: TDictionaryAttribute read Fprinc4_title;
    property princ4_name_type: TDictionaryAttribute read Fprinc4_name_type;
    property princ4_name: TDictionaryAttribute read Fprinc4_name;
    property princ4_add_1: TDictionaryAttribute read Fprinc4_add_1;
    property princ4_city: TDictionaryAttribute read Fprinc4_city;
    property princ4_state: TDictionaryAttribute read Fprinc4_state;
    property princ4_zip5: TDictionaryAttribute read Fprinc4_zip5;
    property princ4_zip4: TDictionaryAttribute read Fprinc4_zip4;
    property princ5_title: TDictionaryAttribute read Fprinc5_title;
    property princ5_name_type: TDictionaryAttribute read Fprinc5_name_type;
    property princ5_name: TDictionaryAttribute read Fprinc5_name;
    property princ5_add_1: TDictionaryAttribute read Fprinc5_add_1;
    property princ5_city: TDictionaryAttribute read Fprinc5_city;
    property princ5_state: TDictionaryAttribute read Fprinc5_state;
    property princ5_zip5: TDictionaryAttribute read Fprinc5_zip5;
    property princ5_zip4: TDictionaryAttribute read Fprinc5_zip4;
    property princ6_title: TDictionaryAttribute read Fprinc6_title;
    property princ6_name_type: TDictionaryAttribute read Fprinc6_name_type;
    property princ6_name: TDictionaryAttribute read Fprinc6_name;
    property princ6_add_1: TDictionaryAttribute read Fprinc6_add_1;
    property princ6_city: TDictionaryAttribute read Fprinc6_city;
    property princ6_state: TDictionaryAttribute read Fprinc6_state;
    property princ6_zip5: TDictionaryAttribute read Fprinc6_zip5;
    property princ6_zip4: TDictionaryAttribute read Fprinc6_zip4;
  end;
  
function Dic: TDicDictionary;

implementation

var
  __Dic: TDicDictionary;

function Dic: TDicDictionary;
begin
  if __Dic = nil then __Dic := TDicDictionary.Create;
  result := __Dic
end;

{ TDicDictionary }

destructor TDicDictionary.Destroy;
begin
  if Fcompanies <> nil then Fcompanies.Free;
  inherited;
end;

function TDicDictionary.Getcompanies: TcompaniesTableDictionary;
begin
  if Fcompanies = nil then Fcompanies := TcompaniesTableDictionary.Create;
  result := Fcompanies;
end;

{ TcompaniesTableDictionary }

constructor TcompaniesTableDictionary.Create;
begin
  inherited;
  Fid := TDictionaryAttribute.Create('id');
  Fname := TDictionaryAttribute.Create('name');
  Fstatus := TDictionaryAttribute.Create('status');
  Ffiling_type := TDictionaryAttribute.Create('filing_type');
  Fprinc_add_1 := TDictionaryAttribute.Create('princ_add_1');
  Fprinc_add_2 := TDictionaryAttribute.Create('princ_add_2');
  Fprinc_city := TDictionaryAttribute.Create('princ_city');
  Fprinc_state := TDictionaryAttribute.Create('princ_state');
  Fprinc_zip := TDictionaryAttribute.Create('princ_zip');
  Fprinc_country := TDictionaryAttribute.Create('princ_country');
  Fmail_add_1 := TDictionaryAttribute.Create('mail_add_1');
  Fmail_add_2 := TDictionaryAttribute.Create('mail_add_2');
  Fmail_city := TDictionaryAttribute.Create('mail_city');
  Fmail_state := TDictionaryAttribute.Create('mail_state');
  Fmail_zip := TDictionaryAttribute.Create('mail_zip');
  Fmail_country := TDictionaryAttribute.Create('mail_country');
  Ffile_date := TDictionaryAttribute.Create('file_date');
  Ffei_number := TDictionaryAttribute.Create('fei_number');
  Fmore_than_six_off_flag := TDictionaryAttribute.Create('more_than_six_off_flag');
  Flast_trx_date := TDictionaryAttribute.Create('last_trx_date');
  Fstate_country := TDictionaryAttribute.Create('state_country');
  Freport_year_1 := TDictionaryAttribute.Create('report_year_1');
  Fhouse_flag_1 := TDictionaryAttribute.Create('house_flag_1');
  Freport_date_1 := TDictionaryAttribute.Create('report_date_1');
  Freport_year_2 := TDictionaryAttribute.Create('report_year_2');
  Fhouse_flag_2 := TDictionaryAttribute.Create('house_flag_2');
  Freport_date_2 := TDictionaryAttribute.Create('report_date_2');
  Freport_year_3 := TDictionaryAttribute.Create('report_year_3');
  Fhouse_flag_3 := TDictionaryAttribute.Create('house_flag_3');
  Freport_date_3 := TDictionaryAttribute.Create('report_date_3');
  Fra_name := TDictionaryAttribute.Create('ra_name');
  Fra_name_type := TDictionaryAttribute.Create('ra_name_type');
  Fra_add_1 := TDictionaryAttribute.Create('ra_add_1');
  Fra_city := TDictionaryAttribute.Create('ra_city');
  Fra_state := TDictionaryAttribute.Create('ra_state');
  Fra_zip5 := TDictionaryAttribute.Create('ra_zip5');
  Fra_zip4 := TDictionaryAttribute.Create('ra_zip4');
  Fprinc1_title := TDictionaryAttribute.Create('princ1_title');
  Fprinc1_name_type := TDictionaryAttribute.Create('princ1_name_type');
  Fprinc1_name := TDictionaryAttribute.Create('princ1_name');
  Fprinc1_add_1 := TDictionaryAttribute.Create('princ1_add_1');
  Fprinc1_city := TDictionaryAttribute.Create('princ1_city');
  Fprinc1_state := TDictionaryAttribute.Create('princ1_state');
  Fprinc1_zip5 := TDictionaryAttribute.Create('princ1_zip5');
  Fprinc1_zip4 := TDictionaryAttribute.Create('princ1_zip4');
  Fprinc2_title := TDictionaryAttribute.Create('princ2_title');
  Fprinc2_name_type := TDictionaryAttribute.Create('princ2_name_type');
  Fprinc2_name := TDictionaryAttribute.Create('princ2_name');
  Fprinc2_add_1 := TDictionaryAttribute.Create('princ2_add_1');
  Fprinc2_city := TDictionaryAttribute.Create('princ2_city');
  Fprinc2_state := TDictionaryAttribute.Create('princ2_state');
  Fprinc2_zip5 := TDictionaryAttribute.Create('princ2_zip5');
  Fprinc2_zip4 := TDictionaryAttribute.Create('princ2_zip4');
  Fprinc3_title := TDictionaryAttribute.Create('princ3_title');
  Fprinc3_name_type := TDictionaryAttribute.Create('princ3_name_type');
  Fprinc3_name := TDictionaryAttribute.Create('princ3_name');
  Fprinc3_add_1 := TDictionaryAttribute.Create('princ3_add_1');
  Fprinc3_city := TDictionaryAttribute.Create('princ3_city');
  Fprinc3_state := TDictionaryAttribute.Create('princ3_state');
  Fprinc3_zip5 := TDictionaryAttribute.Create('princ3_zip5');
  Fprinc3_zip4 := TDictionaryAttribute.Create('princ3_zip4');
  Fprinc4_title := TDictionaryAttribute.Create('princ4_title');
  Fprinc4_name_type := TDictionaryAttribute.Create('princ4_name_type');
  Fprinc4_name := TDictionaryAttribute.Create('princ4_name');
  Fprinc4_add_1 := TDictionaryAttribute.Create('princ4_add_1');
  Fprinc4_city := TDictionaryAttribute.Create('princ4_city');
  Fprinc4_state := TDictionaryAttribute.Create('princ4_state');
  Fprinc4_zip5 := TDictionaryAttribute.Create('princ4_zip5');
  Fprinc4_zip4 := TDictionaryAttribute.Create('princ4_zip4');
  Fprinc5_title := TDictionaryAttribute.Create('princ5_title');
  Fprinc5_name_type := TDictionaryAttribute.Create('princ5_name_type');
  Fprinc5_name := TDictionaryAttribute.Create('princ5_name');
  Fprinc5_add_1 := TDictionaryAttribute.Create('princ5_add_1');
  Fprinc5_city := TDictionaryAttribute.Create('princ5_city');
  Fprinc5_state := TDictionaryAttribute.Create('princ5_state');
  Fprinc5_zip5 := TDictionaryAttribute.Create('princ5_zip5');
  Fprinc5_zip4 := TDictionaryAttribute.Create('princ5_zip4');
  Fprinc6_title := TDictionaryAttribute.Create('princ6_title');
  Fprinc6_name_type := TDictionaryAttribute.Create('princ6_name_type');
  Fprinc6_name := TDictionaryAttribute.Create('princ6_name');
  Fprinc6_add_1 := TDictionaryAttribute.Create('princ6_add_1');
  Fprinc6_city := TDictionaryAttribute.Create('princ6_city');
  Fprinc6_state := TDictionaryAttribute.Create('princ6_state');
  Fprinc6_zip5 := TDictionaryAttribute.Create('princ6_zip5');
  Fprinc6_zip4 := TDictionaryAttribute.Create('princ6_zip4');
end;

initialization
  RegisterEntity(Tcompanies);

finalization
  if __Dic <> nil then __Dic.Free

end.
