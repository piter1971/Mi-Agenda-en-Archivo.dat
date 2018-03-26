unit Anyadir_Contactos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Grids,
  Vcl.Samples.Calendar, Vcl.ComCtrls, Vcl.Imaging.pngimage;

type
  TForm2 = class(TForm)
    Panel1: TPanel;
    AnyadirContactos: TButton;
    EtApellido: TEdit;
    EtCumpleAnyo: TEdit;
    Etdireccion: TEdit;
    EtDNI: TEdit;
    EtNombre: TEdit;
    EtTelefono: TEdit;
    LblApellido: TLabel;
    LblCumplAnyo: TLabel;
    LblDireccion: TLabel;
    LblDni: TLabel;
    LblNombre: TLabel;
    Lbltelefono: TLabel;
    Image1: TImage;
    Fecha: TDateTimePicker;

    procedure AnyadirContactosClick(Sender: TObject);
    procedure FechaClick(Sender: TObject);





  private
    { Private declarations }
  public
    { Public declarations }
  end;

  DatosContactos=record
    DNI:String[12];
    Nombre:String[20];
    Apellido:String[50];
    Direccion:String[50];
    Telefono:String[10];
    CumpleAnyo:String[10];
    end;



var
  Form2: TForm2;
    agenda:array[1..10]of DatosContactos;
  fichero:file of DatosContactos;
  reg:DatosContactos;
  indice:integer ;
  TablaContactos :TStringGrid;

implementation

{$R *.dfm}

    function TotalContactos:integer;
    begin
      TotalContactos:=filesize(fichero);  //devuelve el tamaño del fichero
    end;

function BuscarDNI(dni:string;var ficha:DatosContactos):integer;
    var
     i,fin:integer;
     encontrado:boolean;
    begin
      fin:=TotalContactos-1;
      encontrado:=false;
      BuscarDNI:=-1;
      i:=0;
      while ((not eof(fichero))and(i<=fin)and(not encontrado)) do
      begin
         seek(fichero,i);
         read(fichero,ficha);
         if (ficha.DNI=dni) then
           begin
             encontrado:=true;
             BuscarDNI:=i;
           end
         else
           inc(i);
      end;
    end;


procedure crear;
    begin
       AssignFile(fichero,'Contactos.dat');
       rewrite(fichero); //abrir para escritura machacando
    end;


    procedure abrir;
    begin
       AssignFile(fichero,'Contactos.dat');
       if not(FileExists('Contactos.dat')) then
            rewrite(fichero)
       else
          reset(fichero); //abrir lectura y escritura
    end;



    function insertar(ficha:DatosContactos):integer;
    var
     NumeroFicha:integer;
    begin
       NumeroFicha:=TotalContactos;
       seek(fichero,NumeroFicha); //posicionarse al final del fichero
       write(fichero,ficha); //escribe en el fichero
       insertar:=NumeroFicha;
    end;


    procedure cerrar;
    begin
      closeFile(fichero);
    end;


procedure TForm2.AnyadirContactosClick(Sender: TObject);
var
cad :String;
ficha:DatosContactos;
begin
abrir;
cad :=EtDNI.Text;
if buscarDNI(cad,ficha)<>-1 then
begin
    ShowMessage('el dni ya exisite');
    EtNombre.Clear;
    EtApellido.Clear;
    Etdireccion.Clear;
    EtTelefono.Clear;
    EtDNI.Clear;
    EtCumpleAnyo.Clear;
end
    else
reg.DNI:=ShortString(EtDni.Text);
reg.Nombre:=ShortString(EtNombre.Text);
reg.Apellido:=ShortString(EtApellido.Text);
reg.Direccion:=ShortString(Etdireccion.Text);
reg.Telefono:=ShortString(EtTelefono.Text);
reg.CumpleAnyo:=ShortString(EtCumpleAnyo.Text);
insertar(reg);
 cerrar;
 AnyadirContactos.Enabled:=true;
 EtNombre.Clear;
 EtApellido.Clear;
 Etdireccion.Clear;
 EtDNI.Clear;
 EtCumpleAnyo.Clear;
 EtTelefono.Clear;
 EtNombre.SetFocus;
end;

procedure TForm2.FechaClick(Sender: TObject);
var
a,m,d:Word;
cad:string;
begin
   decodedate(Fecha.Date,d,m,a);
   cad:=inttostr(d)+'/'+inttostr(m)+'/'+inttostr(a);
   EtCumpleAnyo.Text:=cad;
end;


end.
