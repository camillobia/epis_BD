ALTER TABLE funcionario ADD COLUMN email VARCHAR(20);
ALTER TABLE funcionario ADD COLUMN Setor_funcionario VARCHAR(20);
describe Aluno;
describe Funcionario;
describe EPIs;
describe Fornecedor;
describe Usuario;
select * from Funcionario;
select * from EPIs;
INSERT INTO Funcionario (Nome_funcionario,Setor_funcionario) VALUES ('Beatriz Camillo','Produção'), ('Giovani Neves','Manutenção'), ('Caio Gabriel','Almoxarifado'), ('Enzo Turcovic', 'Qualidade'), ('Gabriel Gomes', 'RH');
INSERT INTO EPIs (Nome_epis, CA_epis, Data_Val) VALUES ('Capacete','060108','2026-12-31'),('Luva Nitrila','67890','2026-08-01'), ('Colete', '260715', '2026-07-21'), ('Bota de Segurança', '220405', '2026-10-12'), ('Protetor Auricular', '250709', '2026-05-30'), ('Óculos de Proteção', '252627', '2026-11-25');
INSERT INTO entrega (Id_funcionario,id_epi,dt_entrega,assinatura) VALUES (1,6,'2026-06-01',TRUE), (2,2, '2026-02-25', TRUE), (3,3, '2026-05-14', TRUE), (4,4, '2026-07-26', TRUE), (5,5, '2026-12-03', TRUE), (1,6, '2026-08-06', TRUE), (2,2, '2026-06-07', TRUE), (3,3,'2026-03-20', TRUE), (4,4,'2026-09-01', TRUE), (5,5,'2026-10-09', TRUE);
select * from entrega;

UPDATE entrega
set dt_devolucao = '2026-06-20'
where id_entrega = 1;

UPDATE entrega
set dt_devolucao = '2026-03-01'
where id_entrega = 2;

UPDATE entrega
set dt_devolucao = '2026-05-14'
where id_entrega = 3;

SELECT f.id_funcionario 
FROM Funcionario f
LEFT JOIN Entrega e
ON f.id_funcionario = e.id_funcionario
WHERE e.id_funcionario IS NULL;

SELECT Nome_epis, CA_epis, Data_Val,
DATEDIFF (Data_Val, CURDATE()) AS dias_restantes
FROM EPIs
WHERE Data_Val <= DATE_ADD(CURDATE(), INTERVAL 30 DAY)
ORDER BY Data_Val;

SELECT f.Setor_funcionario AS setor,
    COUNT(e.id_epi) AS total_epis_entregues
FROM entrega e
JOIN Funcionario f 
    ON e.id_funcionario = f.Id_funcionario
GROUP BY f.Setor_funcionario;

SELECT f.Nome_funcionario AS EPIs, en.dt_entrega
FROM entrega en
JOIN funcionario f ON en.id_funcionario = f.id_funcionario
JOIN EPIs e ON en.id_epi = e.Id_epis
WHERE en.assinatura = FALSE;

SELECT f.Id_funcionario, f.Nome_funcionario,
    COUNT(e.id_epi) AS total_epis
FROM entrega e
JOIN Funcionario f 
    ON e.id_funcionario = f.Id_funcionario
GROUP BY f.Id_funcionario, f.Nome_funcionario
HAVING COUNT(e.id_epi) >= 2;
 
 delete from EPIs where Id_epis = 2
