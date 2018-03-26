unit ListaContactos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids;

type
  TForm3 = class(TForm)
    TablaContactos: TStringGrid;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}



procedure TForm3.FormActivate(Sender: TObject);
begin
TablaContactos.Cells[0,0]:='Dni';
TablaContactos.Cells[1,0]:='Nombre';
TablaContactos.Cells[2,0]:='Apellidos';
TablaContactos.Cells[3,0]:='Direccion';
TablaContactos.Cells[4,0]:='Telefono';
TablaContactos.Cells[5,0]:='Cumple Año';

end;

end.
