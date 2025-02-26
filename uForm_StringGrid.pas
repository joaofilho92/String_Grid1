unit uForm_StringGrid;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.DApt;

type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    btn_Configurar: TButton;
    FDConnection1: TFDConnection;
    procedure btn_ConfigurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btn_ConfigurarClick(Sender: TObject);
var
  Q: TFDQuery;
  I, J: Integer;
begin
  // Configuracao do Grid
  StringGrid1.ColCount := 12; // 12 colunas
  StringGrid1.RowCount := 5;  // Inicialmente 5 linhas (ajustaremos conforme os dados)

  // Cabe�alhos da StringGrid
  StringGrid1.Cells[0,0] := 'Id';
  StringGrid1.Cells[1,0] := 'Produto';
  StringGrid1.Cells[2,0] := 'Previsto';
  StringGrid1.Cells[3,0] := 'PG';
  StringGrid1.Cells[4,0] := 'Gasto';
  StringGrid1.Cells[5,0] := 'Valor a mais';
  StringGrid1.Cells[6,0] := 'Vencimento';
  StringGrid1.Cells[7,0] := 'Data';
  StringGrid1.Cells[8,0] := 'Categoria';
  StringGrid1.Cells[9,0] := 'Forma de Pagamento';
  StringGrid1.Cells[10,0] := 'Referente';
  StringGrid1.Cells[11,0] := 'Data Inserimento';

  // Tamanhos das colunas
  for J := 0 to StringGrid1.ColCount - 1 do
    StringGrid1.ColWidths[J] := 100;

  // Criar a query para buscar os dados
  Q := TFDQuery.Create(Self);
  try
    Q.Connection := FDConnection1;
    Q.SQL.Text := 'SELECT * FROM gastos_essenciais';
    Q.Open;

    // Ajustar o n�mero de linhas da StringGrid de acordo com o n�mero de registros retornados
    StringGrid1.RowCount := Q.RecordCount + 1;  // +1 por causa dos cabe�alhos na linha 0

    // Loop para preencher as linhas (registros)
    I := 1;  // Come�amos da linha 1, j� que a linha 0 � para cabe�alhos   //Isso e BASICO DO FOR
    while not Q.Eof do
    begin
      // Loop para preencher as colunas (campos de cada registro)
      for J := 0 to StringGrid1.ColCount - 1 do // J esta para as colunas ou seja de 0 ate o ultimo valor que e 'StringGrid1.ColCount - 1' / O Sistema faz a conta para ti!
      begin
        // Preenchemos cada c�lula com o valor do campo correspondente
        StringGrid1.Cells[J, I] := Q.Fields[J].AsString;  // J esta para as colunas e I para as linhas, depois ele chama J novamente para indicar o numero de coulunas.
      end;

      // Passa para o pr�ximo registro no banco
      Q.Next;
      Inc(I); // Passa para a pr�xima linha da StringGrid ESSENCIAL isso eu NAO SABIA se nao ele da sempre o 1 record e o unico!
    end;

  finally
    Q.Free;
  end;
end;


end.

{Explica��o do C�digo:
Configura��o da StringGrid:

Configuramos o n�mero de colunas (ColCount := 12) e linhas (RowCount := 5 para in�cio).
Preenchemos as c�lulas da linha 0 com os cabe�alhos.
Definindo os tamanhos das colunas:

Usamos um for para ajustar a largura das colunas de forma uniforme (100 unidades para cada coluna).
Criando a Query:

Criamos um objeto TFDQuery para executar a consulta SELECT * FROM gastos_essenciais.
Preenchendo a StringGrid com dois loops for:

while not Q.Eof: Este loop percorre todos os registros retornados pelo banco de dados.
Para cada registro:
for J := 0 to StringGrid1.ColCount - 1: Este for percorre cada campo (coluna) do registro atual, preenchendo as c�lulas da StringGrid.
A fun��o Q.Fields[J].AsString obt�m o valor de cada campo e o converte em string para preencher a c�lula.
Ap�s preencher as colunas de uma linha, chamamos Q.Next para passar para o pr�ximo registro no banco de dados.
O contador I � incrementado ap�s cada registro para preencher a pr�xima linha da StringGrid.
Ajuste Din�mico de Linhas:

StringGrid1.RowCount := Q.RecordCount + 1 ajusta o n�mero de linhas na StringGrid com base no n�mero de registros retornados pela consulta, acrescentando 1 para a linha dos cabe�alhos.
O que vai acontecer:
A StringGrid vai exibir todos os registros da tabela gastos_essenciais.
Cada linha representar� um registro da tabela.
Cada coluna exibir� um campo do registro, como Id, Produto, Gasto, etc.}