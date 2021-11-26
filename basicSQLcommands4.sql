SELECT nome FROM taluno;

--
SELECT Concat(cod_aluno, nome) FROM taluno;

-- || tem o mesmo efeito que Concat
SELECT cod_aluno || ' - ' || nome FROM taluno;

-- InitCap coloca a primeira letra das palavras em maiuscúlo
SELECT InitCap(nome) FROM taluno;

-- InStr retorna a posição que a letra r está no nome. Se não tiver a letra r na nome, então retorna 0.
SELECT nome, InStr(nome, 'r') FROM taluno;

--
SELECT Length(nome) FROM taluno;

-- Lower transforma os caracteres em minusculo
SELECT nome, Lower(nome) FROM taluno;

-- Upper transforma os caracteres em maiúsculo
SELECT nome, Upper(nome) FROM taluno;

--
SELECT InitCap('JOSE DA SILVA') FROM dual;

--LPad - L -> left. Coloca zero a esquerda de cod_aluno até preencher 5 caracteres
SELECT LPad(cod_aluno, 5, '0') FROM taluno;

--RPad - R -> right. Coloca zero a direita de cod_aluno  até preencher 8 caracteres
SELECT nome, salario, RPad(salario, 8, '0') FROM taluno;

-- Colocar $ até preencher 10 caracteres
SELECT nome, RPad(nome, 10, '$') FROM taluno;

-- Copia parte de um texto
-- SubStr(campo/texto, posicao, qtd de caracteres)
SELECT SubStr(nome, 1, 3) FROM taluno;

--
SELECT SubStr(nome, 1, 1) FROM taluno;

--
SELECT nome, SubStr(nome, 3, 1) FROM taluno; 

-- Substitui o caracter r por $
SELECT REPLACE (Upper(nome), 'R', '$') FROM taluno;

--
SELECT nome, SubStr(nome, Length(nome), 1) FROM taluno;         

--
SELECT nome, SubStr(nome, Length(nome) -1, 2) FROM taluno;

--
SELECT nome, SubStr(nome, 3, Length(nome)-3) FROM taluno;

SELECT * FROM taluno
WHERE Lower(nome) = 'marcio';

SELECT * FROM taluno
WHERE Upper(nome) = 'MARIA';

SELECT * FROM taluno
WHERE Upper(SubStr(cidade, 1, 3)) = 'IVO';

UPDATE taluno SET
salario = 633.47
WHERE cod_aluno = 1;

SELECT * from taluno;

SELECT
  salario,
  REPLACE(salario, '.' , ''),
  RPad(salario, 10, '0'),
  LPad(salario, 10, '0'),
  LPad(REPLACE(salario, '.' , ''), 10, '0')
FROM taluno;