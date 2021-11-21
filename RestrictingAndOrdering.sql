SELECT * FROM taluno;

-- ALTER TABLE TALUNO DROP COLUMN COLUNA;
ALTER TABLE taluno ADD estado CHAR(2) DEFAULT 'RS';

ALTER TABLE taluno ADD salario NUMBER(8,2) DEFAULT 620;

-- ATUALIZANDO ESTADO E SALÁRIO QUANDO COD_ALUNO = 1
UPDATE taluno SET
estado = 'AC', salario = 250
WHERE cod_aluno = 1;

UPDATE taluno SET
estado = 'MT', salario = 2000
WHERE cod_aluno = 2;

UPDATE taluno SET
estado = 'SP', salario = 800
WHERE cod_aluno = 5;

SELECT * FROM taluno;

COMMIT;

-- Fazendo um filtro na tabela
--Seleciona da tabela taluno quando estado for diferente de RS
--  e salario <= 800, ordena por salario desc
SELECT * FROM taluno
WHERE estado <> 'RS'
AND salario <= 800
ORDER BY salario desc;

INSERT INTO taluno (cod_aluno, nome, cidade)
VALUES (seq_aluno.NEXTVAL, 'Valdo', 'Dois Irmãos');

INSERT INTO taluno (cod_aluno, nome, cidade)
VALUES (seq_aluno.NEXTVAL, 'Aldo', 'Quatro Irmãos');

UPDATE taluno SET
estado = 'SP', salario = 900, nome = 'Pedro'
WHERE cod_aluno = 25;

SELECT estado, salario, nome FROM taluno
ORDER BY estado, salario DESC;

--Adiciona o campo nascimento e coloca a data atual menos mil dias
ALTER TABLE taluno ADD nascimento DATE DEFAULT SYSDATE - 1000;

SELECT SYSDATE - SYSDATE - 100 FROM dual;

SELECT * FROM taluno;

--
UPDATE taluno SET
nascimento = '10/10/2001'
WHERE cod_aluno = 1;

UPDATE taluno SET
nascimento = '10/08/2000'
WHERE cod_aluno = 2;

SELECT * FROM taluno;

--

-- Trunc ignora a hora, a hora passa a ser 00:00:00
SELECT cod_aluno, nascimento, Trunc(nascimento) AS nascimento, nome
FROM taluno
WHERE Trunc nascimento = '25/02/2019';


SELECT cod_aluno, nascimento, Trunc(nascimento), nome
FROM taluno
WHERE nascimento
  BETWEEN To_Date('21/05/2010 15:00', 'dd/mm/yyyy HH24:MI')
    AND To_Date('26/02/2019 21:00', dd/mm/yyyy HH24:MI')

SELECT cod_aluno, data, total,
       desconto, desconto + 1000 as calculo
FROM tcontrato
WHERE total <= desconto + 1000;

--

SELECT * FROM tcontrato;

--

UPDATE tcontrato SET
deconto = NULL
WHERE cod_contrato = 2;

--
                
SELECT * FROM tcontrato
WHERE desconto IS NULL;

--

SELECT * FROM tcontrato
WHERE desconto IS NOT NULL;

--

SELECT * FROM tcontrato
WHERE desconto BETWEEN 0 AND 10;

--NVL  Colunas com valor null, se o desconto for null retorna 0
SELECT cod_contrato, total, desconto, NVL(desconto, 0)
FROM tcontrato
WHERE NVL(deconto, 0) BETWEEN 0 AND 10;

-- Mesmo efeito do BETWEEN
SELECT * FROM tcontrato
WHERE desconto >= 0
AND desconto <= 10
OR desconto IS NULL;

-- IN /// NOT IN
SELECT * FROM titem
WHERE cod_curso IN (1, 2, 3);

SELECT * FROM titem
WHERE cod_curso NOT IN (1, 2, 3);

INSERT INTO tcurso VALUES (5, 'Windows', 1000, 50);

SELECT * FROM tcurso;

-- Cursos não vendidos
SELECT * FROM tcurso
WHERE cod_curso NOT IN (SELECT cod_curso FROM titem);

-- Cursos vendidos
SELECT * FROM tcurso
WHERE cod_curso IN (SELECT cod_curso FROM titem);

-- Equivalente ao SELECT IN
SELECT * FROM titem
WHERE cod_curso = 1
OR cod_curso = 2
OR cod_curso = 4;

-- Somente onde a segunda letra seja A
SELECT * FROM taluno WHERE nome LIKE '_A%'; 


-- Seleciona curso que tenho nome java
SELECT * FROM tcurso WHERE nome LIKE '%JAVA%'; 


-- Seleciona curso onde nome termina com FACES
SELECT * FROM tcurso WHERE nome LIKE '%FACES'; 


SELECT * FROM tcurso;

ALTER TABLE tcurso ADD pre_req INTEGER;

UPDATE tcurso SET
pre_req = 1
WHERE cod_curso = 2;

UPDATE tcurso SET
pre_req = 3
WHERE cod_curso = 4;

SELECT * FROM tcurso;

-- Cursos sem pre-requisito
SELECT * FROM tcurso WHERE pre_req IS NULL;

-- Cursos com pre-requisito
SELECT * FROM tcurso WHERE pre_req IS NOT NULL;

--

-- Precedência de operadores
-- ()
-- AND
-- OR
SELECT * FROM tcurso
WHERE valor > 750
OR valor < 1000
AND carga_horaria = 25;

--

SELECT * FROM tcurso
WHERE (valor > 750
OR valor < 1000)
AND carga_horaria = 25;

--
                
COMMIT;
