unit ListaSocios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids;

type
  TForm3 = class(TForm)
    TablaConatctos: TStringGrid;
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
TablaConatctos.Cells[0,0]:='Dni';
TablaConatctos.Cells[1,0]:='Nombre';
TablaConatctos.Cells[2,0]:='Apellidos';
TablaConatctos.Cells[3,0]:='Direccion';
TablaConatctos.Cells[4,0]:='Telefono';
TablaConatctos.Cells[5,0]:='Cumple Año';

end;

end.
