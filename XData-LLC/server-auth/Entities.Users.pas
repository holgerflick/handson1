unit Entities.Users;

interface

uses
  SysUtils, 
  Generics.Collections, 
  Aurelius.Mapping.Attributes, 
  Aurelius.Types.Blob, 
  Aurelius.Types.DynamicProperties, 
  Aurelius.Types.Nullable, 
  Aurelius.Types.Proxy;

type
  Tusers = class;
  
  [Entity]
  [Table('users')]
  [Id('Fid', TIdGenerator.IdentityOrSequence)]
  Tusers = class
  private
    [Column('id', [TColumnProp.Required, TColumnProp.NoInsert, TColumnProp.NoUpdate])]
    Fid: Int64;
    
    [Column('login', [TColumnProp.Required], 50)]
    Flogin: string;
    
    [Column('name', [TColumnProp.Required], 100)]
    Fname: string;
    
    [Column('pw', [TColumnProp.Required], 100)]
    Fpw: string;
  public
    property id: Int64 read Fid write Fid;
    property login: string read Flogin write Flogin;
    property name: string read Fname write Fname;
    property pw: string read Fpw write Fpw;
  end;
  

implementation

initialization
  RegisterEntity(Tusers);

finalization

end.
