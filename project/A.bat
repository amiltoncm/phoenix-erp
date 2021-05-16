@Echo off
cls

del *.~*
del *.dcu
del *.ddp
rd __history /s /q
rd __recovery /s /q

cd..
cd classes
rd __history /s /q
rd __recovery /s /q

cd..
cd dados
rd __history /s /q
rd __recovery /s /q

cd..
cd dao
rd __history /s /q
rd __recovery /s /q

cd..
cd funcoes
rd __history /s /q
rd __recovery /s /q

cd..
cd templates
rd __history /s /q
rd __recovery /s /q

cd..
cd var
rd __history /s /q
rd __recovery /s /q

cd..
cd view
cd cadastros
rd __history /s /q
rd __recovery /s /q

cd..
cd consultas
rd __history /s /q
rd __recovery /s /q

cd..
cd estrutura
rd __history /s /q
rd __recovery /s /q

cd..
cd mensagens
rd __history /s /q
rd __recovery /s /q

cd..
cd movimentacoes
rd __history /s /q
rd __recovery /s /q

cd..
cd procuras
rd __history /s /q
rd __recovery /s /q

cd..
cd relatorios
rd __history /s /q
rd __recovery /s /q

cd..
cd uteis
rd __history /s /q
rd __recovery /s /q

cd..
cd..
cd..
cd dcus
rd debug /s /q
rd release /s /q
