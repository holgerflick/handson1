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




implementation

initialization
  RegisterEntity(Tcompanies);


end.
