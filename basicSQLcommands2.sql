SELECT cod_aluno, nome, cidade
FROM TALUNO;

--Colocou um apelido na coluna nome
SELECT cod_aluno AS codigo, NOME "Nome do Aluno"
FROM TALUNO;

-- Distinct retira linhas duplicadas
-- todas as colunas tem que ser iguais
SELECT CIDADE FROM TALUNO;

SELECT DISTINCT CIDADE FROM TALUNO;

SELECT DISTINCT cidade FROM TALUNO;

--Seleciona cidade e cod_aluno da tabela TALUNO e ordena por cidade(ordem alfabética)
SELECT cidade, cod_aluno
FROM TALUNO
ORDER BY CIDADE;

SELECT DISTINCT cidade, cod_aluno
FROM TALUNO
ORDER BY CIDADE;

-- 
SELECT nome AS CURSO,
       valor,
       valor/carga_horaria,
       Round(valor/carga_horaria,2) AS valor_hora
FROM TCURSO
ORDER BY valor_hora;
--Apelido de coluna só funciona em ORDER BY

SELECT * FROM TCONTRATO;

UPDATE TCONTRATO SET
desconto = NULL
WHERE cod_contrato = 4;       

--Calcula com coluna = null
--resultado = null
--oBS: COLUNAS NULAS ANULAM TODO O CALCULO
SELECT cod_contrato,
       total,
       desconto,
       total+desconto
FROM TCONTRATO;

--Comando Nvl trata colunas nulas
SELECT cod_contrato,
       desconto,
       Nvl(desconto,0),
       total,
       total+ Nvl(desconto,0) AS total_mais_desconto
FROM TCONTRATO;

SELECT cod_aluno || ' - ' || nome || ' // ' || cidade AS ALUNO
FROM TALUNO
ORDER BY cod_aluno;



    INTEGER       - 1, 2 --numero inteiro -> number(38)

    NUMBER (5,2)  - 999,99
    NUMERIC (5,2) - 999,99

    DATE          - '28/10/2021 16:40:00'

    VARCHAR2(10) - 'MARCIO'
    CHAR(10)    - 'MARCIO'
