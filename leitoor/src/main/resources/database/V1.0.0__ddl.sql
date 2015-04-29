CREATE TABLE USUARIO (ID INTEGER NOT NULL, PERFIL VARCHAR(50), ATIVO BOOLEAN, CONVITE VARCHAR(50) UNIQUE, EMAIL VARCHAR(100) UNIQUE, IDFACEBOOK VARCHAR(50) UNIQUE, IDGOOGLE VARCHAR(50) UNIQUE, NOME VARCHAR(100), REDESOCIAL VARCHAR(50), SENHA VARCHAR(50), CONVIDADOPOR_ID INTEGER, PRIMARY KEY (ID));
CREATE INDEX IX_USUARIO_FK_USUARIO_CONVIDADOPOR_ID ON USUARIO (CONVIDADOPOR_ID);
CREATE TABLE TAREFAENVIADA (ID INTEGER NOT NULL, ALUNO_ID INTEGER NOT NULL, TAREFA_ID INTEGER, PRIMARY KEY (ID));
CREATE INDEX IX_TAREFAENVIADA_FK_TAREFAENVIADA_TAREFA_ID ON TAREFAENVIADA (TAREFA_ID);
CREATE INDEX IX_TAREFAENVIADA_FK_TAREFAENVIADA_ALUNO_ID ON TAREFAENVIADA (ALUNO_ID);
CREATE TABLE QUESTAO (ID INTEGER NOT NULL, TIPO VARCHAR(50), DESCRICAO VARCHAR(1000), PESO INTEGER, PRIMARY KEY (ID));
CREATE TABLE QUESTAODISSERTATIVA (ID INTEGER NOT NULL, PRIMARY KEY (ID));
CREATE TABLE QUESTAOOBJETIVA (ID INTEGER NOT NULL, PRIMARY KEY (ID));
CREATE TABLE TURMA (ID INTEGER NOT NULL, NOME VARCHAR(50), PRIMARY KEY (ID));
CREATE TABLE RESPOSTA (ID INTEGER NOT NULL, TIPO VARCHAR(50), AVALIACAO VARCHAR(50), QUESTAO_ID INTEGER, TAREFAENVIADA_ID INTEGER, PRIMARY KEY (ID));
CREATE INDEX IX_RESPOSTA_FK_RESPOSTA_QUESTAO_ID ON RESPOSTA (QUESTAO_ID);
CREATE INDEX IX_RESPOSTA_FK_RESPOSTA_TAREFAENVIADA_ID ON RESPOSTA (TAREFAENVIADA_ID);
CREATE TABLE RESPOSTADISSERTATIVA (ID INTEGER NOT NULL, REPOSTA VARCHAR(5000), PRIMARY KEY (ID));
CREATE TABLE ATIVIDADE (ID INTEGER NOT NULL, DESCRICAO VARCHAR(50), PROFESSOR_ID INTEGER NOT NULL, MATERIALCONFIGURADO_ID INTEGER, PRIMARY KEY (ID));
CREATE INDEX IX_ATIVIDADE_FK_ATIVIDADE_PROFESSOR_ID ON ATIVIDADE (PROFESSOR_ID);
CREATE INDEX IX_ATIVIDADE_FK_ATIVIDADE_MATERIALCONFIGURADO_ID ON ATIVIDADE (MATERIALCONFIGURADO_ID);
CREATE TABLE RESPOSTAOBJETIVA (ID INTEGER NOT NULL, PRIMARY KEY (ID));
CREATE TABLE TAREFA (ID INTEGER NOT NULL, DESCRICAOATIVIDADE VARCHAR(50), IDATIVIDADE INTEGER, MATERIALCONFIGURADO_ID INTEGER, PROFESSOR_ID INTEGER NOT NULL, TURMA_ID INTEGER, PRIMARY KEY (ID));
CREATE INDEX IX_TAREFA_FK_TAREFA_MATERIALCONFIGURADO_ID ON TAREFA (MATERIALCONFIGURADO_ID);
CREATE INDEX IX_TAREFA_FK_TAREFA_TURMA_ID ON TAREFA (TURMA_ID);
CREATE INDEX IX_TAREFA_FK_TAREFA_PROFESSOR_ID ON TAREFA (PROFESSOR_ID);
CREATE TABLE MATERIAL (ID INTEGER NOT NULL, ARQUIVOUNICO VARCHAR(50), NUMEROPAGINAS INTEGER, TITULO VARCHAR(50), PROFESSOR_ID INTEGER NOT NULL, PRIMARY KEY (ID));
CREATE INDEX IX_MATERIAL_FK_MATERIAL_PROFESSOR_ID ON MATERIAL (PROFESSOR_ID);
CREATE TABLE QUESTIONARIO (ID INTEGER NOT NULL, DESCRICAO VARCHAR(1000), NOME VARCHAR(50), CRIADOR_ID INTEGER, PRIMARY KEY (ID));
CREATE INDEX IX_QUESTIONARIO_FK_QUESTIONARIO_CRIADOR_ID ON QUESTIONARIO (CRIADOR_ID);
CREATE TABLE RESPOSTASQUESTIONARIO (ID INTEGER NOT NULL, QUESTIONARIO_ID INTEGER, RESPONDENTE_ID INTEGER, TAREFAENVIADA_ID INTEGER, PRIMARY KEY (ID));
CREATE INDEX RESPOSTASQUESTIONARIO_FK_RESPOSTASQUESTIONARIO_RESPONDENTE_ID ON RESPOSTASQUESTIONARIO (RESPONDENTE_ID);
CREATE INDEX RESPOSTASQUESTIONARIO_FK_RESPOSTASQUESTIONARIO_QUESTIONARIO_ID ON RESPOSTASQUESTIONARIO (QUESTIONARIO_ID);
CREATE INDEX RESPOSTASQUESTIONARIO_FK_RESPOSTASQUESTIONARIO_TAREFAENVIADA_ID ON RESPOSTASQUESTIONARIO (TAREFAENVIADA_ID);
CREATE TABLE CONFIGURACAOPAGINA (ID INTEGER NOT NULL, MINMINUTOSPORPAGINA INTEGER, PAGINA INTEGER, MATERIALCONFIGURADO_ID INTEGER, PRIMARY KEY (ID));
CREATE INDEX CONFIGURACAOPAGINA_FK_CONFIGURACAOPAGINA_MATERIALCONFIGURADO_ID ON CONFIGURACAOPAGINA (MATERIALCONFIGURADO_ID);
CREATE TABLE MATERIALCONFIGURADO (ID INTEGER NOT NULL, MINMINUTOSPORPAGINA INTEGER, MATERIAL_ID INTEGER, PROFESSOR_ID INTEGER NOT NULL, PRIMARY KEY (ID));
CREATE INDEX IX_MATERIALCONFIGURADO_FK_MATERIALCONFIGURADO_MATERIAL_ID ON MATERIALCONFIGURADO (MATERIAL_ID);
CREATE INDEX IX_MATERIALCONFIGURADO_FK_MATERIALCONFIGURADO_PROFESSOR_ID ON MATERIALCONFIGURADO (PROFESSOR_ID);
CREATE TABLE LEITURA (ID INTEGER NOT NULL, DATAFINAL TIMESTAMP, DATAINICIAL TIMESTAMP, PAGINA INTEGER, TAREFAENVIADA_ID INTEGER, PRIMARY KEY (ID));
CREATE INDEX IX_LEITURA_FK_LEITURA_TAREFAENVIADA_ID ON LEITURA (TAREFAENVIADA_ID);
CREATE TABLE QUESTAOOBJETIVAALTERNATIVA (ID INTEGER NOT NULL, CORRETA BOOLEAN NOT NULL, DESCRICAO VARCHAR(1000) NOT NULL, QUESTAO_ID INTEGER, PRIMARY KEY (ID));
CREATE INDEX QUESTAOOBJETIVAALTERNATIVAFKQUESTAOOBJETIVAALTERNATIVAQUESTAOID ON QUESTAOOBJETIVAALTERNATIVA (QUESTAO_ID);
CREATE TABLE TAREFAENVIADAACESSO (TarefaEnviada_ID INTEGER, dataAcesso TIMESTAMP);
CREATE INDEX IX_TAREFAENVIADAACESSO_FK_TAREFAENVIADAACESSO_TarefaEnviada_ID ON TAREFAENVIADAACESSO (TarefaEnviada_ID);
CREATE TABLE QUESTAOHABILIDADE (Questao_ID INTEGER, habilidade VARCHAR(50));
CREATE INDEX IX_QUESTAOHABILIDADE_FK_QUESTAOHABILIDADE_Questao_ID ON QUESTAOHABILIDADE (Questao_ID);
CREATE TABLE TURMA_USUARIO (Turma_ID INTEGER NOT NULL, alunos_ID INTEGER NOT NULL, PRIMARY KEY (Turma_ID, alunos_ID));
CREATE INDEX IX_TURMA_USUARIO_FK_TURMA_USUARIO_alunos_ID ON TURMA_USUARIO (alunos_ID);
CREATE INDEX IX_TURMA_USUARIO_FK_TURMA_USUARIO_Turma_ID ON TURMA_USUARIO (Turma_ID);
CREATE TABLE RESPOSTAOBJETIVA_QUESTAOOBJETIVAALTERNATIVA (RespostaObjetiva_ID INTEGER NOT NULL, alternativasSelecionadas_ID INTEGER NOT NULL, PRIMARY KEY (RespostaObjetiva_ID, alternativasSelecionadas_ID));
CREATE INDEX RSPSTBJTVQSTBJTVLTRNTVRSPSTBJTVQSTBJTVLTRNTVARespostaObjetivaID ON RESPOSTAOBJETIVA_QUESTAOOBJETIVAALTERNATIVA (RespostaObjetiva_ID);
CREATE INDEX RSPSTBJTVQSTBJTVLTRNTVRSPSTBJTVQSTBJTVLTRNTVltrntvsSlcionadasID ON RESPOSTAOBJETIVA_QUESTAOOBJETIVAALTERNATIVA (alternativasSelecionadas_ID);
CREATE TABLE MATERIALPAGINADO (Material_ID INTEGER, arquivoPaginado VARCHAR(50), pagina INTEGER);
CREATE INDEX IX_MATERIALPAGINADO_FK_MATERIALPAGINADO_Material_ID ON MATERIALPAGINADO (Material_ID);
CREATE TABLE QUESTIONARIO_QUESTAO (Questionario_ID INTEGER NOT NULL, questoes_ID INTEGER NOT NULL, PRIMARY KEY (Questionario_ID, questoes_ID));
CREATE INDEX IX_QUESTIONARIO_QUESTAO_FK_QUESTIONARIO_QUESTAO_questoes_ID ON QUESTIONARIO_QUESTAO (questoes_ID);
CREATE INDEX IX_QUESTIONARIO_QUESTAO_FK_QUESTIONARIO_QUESTAO_Questionario_ID ON QUESTIONARIO_QUESTAO (Questionario_ID);
CREATE TABLE RESPOSTASQUESTIONARIO_RESPOSTA (RespostasQuestionario_ID INTEGER NOT NULL, respostas_ID INTEGER NOT NULL, PRIMARY KEY (RespostasQuestionario_ID, respostas_ID));
CREATE INDEX RSPSTSQSTIONARIORESPOSTAFKRSPSTSQUESTIONARIORESPOSTArespostasID ON RESPOSTASQUESTIONARIO_RESPOSTA (respostas_ID);
CREATE INDEX RSPSTSQSTNRRSPOSTAFKRSPSTSQSTNRORESPOSTARespostasQuestionarioID ON RESPOSTASQUESTIONARIO_RESPOSTA (RespostasQuestionario_ID);
CREATE TABLE CONFIGURACAOPAGINA_QUESTAO (ConfiguracaoPagina_ID INTEGER NOT NULL, questoes_ID INTEGER NOT NULL, PRIMARY KEY (ConfiguracaoPagina_ID, questoes_ID));
CREATE INDEX CONFIGURACAOPAGINAQUESTAOFKCONFIGURACAOPAGINAQUESTAOquestoes_ID ON CONFIGURACAOPAGINA_QUESTAO (questoes_ID);
CREATE INDEX CNFGRCOPAGINAQUESTAOFKCNFGRCAOPAGINAQUESTAOConfiguracaoPaginaID ON CONFIGURACAOPAGINA_QUESTAO (ConfiguracaoPagina_ID);
ALTER TABLE USUARIO ADD CONSTRAINT FK_USUARIO_CONVIDADOPOR_ID FOREIGN KEY (CONVIDADOPOR_ID) REFERENCES USUARIO (ID);
ALTER TABLE TAREFAENVIADA ADD CONSTRAINT FK_TAREFAENVIADA_TAREFA_ID FOREIGN KEY (TAREFA_ID) REFERENCES TAREFA (ID);
ALTER TABLE TAREFAENVIADA ADD CONSTRAINT FK_TAREFAENVIADA_ALUNO_ID FOREIGN KEY (ALUNO_ID) REFERENCES USUARIO (ID);
ALTER TABLE QUESTAODISSERTATIVA ADD CONSTRAINT FK_QUESTAODISSERTATIVA_ID FOREIGN KEY (ID) REFERENCES QUESTAO (ID);
ALTER TABLE QUESTAOOBJETIVA ADD CONSTRAINT FK_QUESTAOOBJETIVA_ID FOREIGN KEY (ID) REFERENCES QUESTAO (ID);
ALTER TABLE RESPOSTA ADD CONSTRAINT FK_RESPOSTA_QUESTAO_ID FOREIGN KEY (QUESTAO_ID) REFERENCES QUESTAO (ID);
ALTER TABLE RESPOSTA ADD CONSTRAINT FK_RESPOSTA_TAREFAENVIADA_ID FOREIGN KEY (TAREFAENVIADA_ID) REFERENCES TAREFAENVIADA (ID);
ALTER TABLE RESPOSTADISSERTATIVA ADD CONSTRAINT FK_RESPOSTADISSERTATIVA_ID FOREIGN KEY (ID) REFERENCES RESPOSTA (ID);
ALTER TABLE ATIVIDADE ADD CONSTRAINT FK_ATIVIDADE_PROFESSOR_ID FOREIGN KEY (PROFESSOR_ID) REFERENCES USUARIO (ID);
ALTER TABLE ATIVIDADE ADD CONSTRAINT FK_ATIVIDADE_MATERIALCONFIGURADO_ID FOREIGN KEY (MATERIALCONFIGURADO_ID) REFERENCES MATERIALCONFIGURADO (ID);
ALTER TABLE RESPOSTAOBJETIVA ADD CONSTRAINT FK_RESPOSTAOBJETIVA_ID FOREIGN KEY (ID) REFERENCES RESPOSTA (ID);
ALTER TABLE TAREFA ADD CONSTRAINT FK_TAREFA_MATERIALCONFIGURADO_ID FOREIGN KEY (MATERIALCONFIGURADO_ID) REFERENCES MATERIALCONFIGURADO (ID);
ALTER TABLE TAREFA ADD CONSTRAINT FK_TAREFA_TURMA_ID FOREIGN KEY (TURMA_ID) REFERENCES TURMA (ID);
ALTER TABLE TAREFA ADD CONSTRAINT FK_TAREFA_PROFESSOR_ID FOREIGN KEY (PROFESSOR_ID) REFERENCES USUARIO (ID);
ALTER TABLE MATERIAL ADD CONSTRAINT FK_MATERIAL_PROFESSOR_ID FOREIGN KEY (PROFESSOR_ID) REFERENCES USUARIO (ID);
ALTER TABLE QUESTIONARIO ADD CONSTRAINT FK_QUESTIONARIO_CRIADOR_ID FOREIGN KEY (CRIADOR_ID) REFERENCES USUARIO (ID);
ALTER TABLE RESPOSTASQUESTIONARIO ADD CONSTRAINT FK_RESPOSTASQUESTIONARIO_RESPONDENTE_ID FOREIGN KEY (RESPONDENTE_ID) REFERENCES USUARIO (ID);
ALTER TABLE RESPOSTASQUESTIONARIO ADD CONSTRAINT FK_RESPOSTASQUESTIONARIO_QUESTIONARIO_ID FOREIGN KEY (QUESTIONARIO_ID) REFERENCES QUESTIONARIO (ID);
ALTER TABLE RESPOSTASQUESTIONARIO ADD CONSTRAINT FK_RESPOSTASQUESTIONARIO_TAREFAENVIADA_ID FOREIGN KEY (TAREFAENVIADA_ID) REFERENCES TAREFAENVIADA (ID);
ALTER TABLE CONFIGURACAOPAGINA ADD CONSTRAINT FK_CONFIGURACAOPAGINA_MATERIALCONFIGURADO_ID FOREIGN KEY (MATERIALCONFIGURADO_ID) REFERENCES MATERIALCONFIGURADO (ID);
ALTER TABLE MATERIALCONFIGURADO ADD CONSTRAINT FK_MATERIALCONFIGURADO_MATERIAL_ID FOREIGN KEY (MATERIAL_ID) REFERENCES MATERIAL (ID);
ALTER TABLE MATERIALCONFIGURADO ADD CONSTRAINT FK_MATERIALCONFIGURADO_PROFESSOR_ID FOREIGN KEY (PROFESSOR_ID) REFERENCES USUARIO (ID);
ALTER TABLE LEITURA ADD CONSTRAINT FK_LEITURA_TAREFAENVIADA_ID FOREIGN KEY (TAREFAENVIADA_ID) REFERENCES TAREFAENVIADA (ID);
ALTER TABLE QUESTAOOBJETIVAALTERNATIVA ADD CONSTRAINT FK_QUESTAOOBJETIVAALTERNATIVA_QUESTAO_ID FOREIGN KEY (QUESTAO_ID) REFERENCES QUESTAO (ID);
ALTER TABLE TAREFAENVIADAACESSO ADD CONSTRAINT FK_TAREFAENVIADAACESSO_TarefaEnviada_ID FOREIGN KEY (TarefaEnviada_ID) REFERENCES TAREFAENVIADA (ID);
ALTER TABLE QUESTAOHABILIDADE ADD CONSTRAINT FK_QUESTAOHABILIDADE_Questao_ID FOREIGN KEY (Questao_ID) REFERENCES QUESTAO (ID);
ALTER TABLE TURMA_USUARIO ADD CONSTRAINT FK_TURMA_USUARIO_alunos_ID FOREIGN KEY (alunos_ID) REFERENCES USUARIO (ID);
ALTER TABLE TURMA_USUARIO ADD CONSTRAINT FK_TURMA_USUARIO_Turma_ID FOREIGN KEY (Turma_ID) REFERENCES TURMA (ID);
ALTER TABLE RESPOSTAOBJETIVA_QUESTAOOBJETIVAALTERNATIVA ADD CONSTRAINT RESPOSTAOBJETIVA_QUESTAOOBJETIVAALTERNATIVA_RespostaObjetiva_ID FOREIGN KEY (RespostaObjetiva_ID) REFERENCES RESPOSTA (ID);
ALTER TABLE RESPOSTAOBJETIVA_QUESTAOOBJETIVAALTERNATIVA ADD CONSTRAINT RSPSTAOBJETIVAQUESTAOOBJETIVAALTERNATIVAltrntivasSelecionadasID FOREIGN KEY (alternativasSelecionadas_ID) REFERENCES QUESTAOOBJETIVAALTERNATIVA (ID);
ALTER TABLE MATERIALPAGINADO ADD CONSTRAINT FK_MATERIALPAGINADO_Material_ID FOREIGN KEY (Material_ID) REFERENCES MATERIAL (ID);
ALTER TABLE QUESTIONARIO_QUESTAO ADD CONSTRAINT FK_QUESTIONARIO_QUESTAO_questoes_ID FOREIGN KEY (questoes_ID) REFERENCES QUESTAO (ID);
ALTER TABLE QUESTIONARIO_QUESTAO ADD CONSTRAINT FK_QUESTIONARIO_QUESTAO_Questionario_ID FOREIGN KEY (Questionario_ID) REFERENCES QUESTIONARIO (ID);
ALTER TABLE RESPOSTASQUESTIONARIO_RESPOSTA ADD CONSTRAINT FK_RESPOSTASQUESTIONARIO_RESPOSTA_respostas_ID FOREIGN KEY (respostas_ID) REFERENCES RESPOSTA (ID);
ALTER TABLE RESPOSTASQUESTIONARIO_RESPOSTA ADD CONSTRAINT FK_RESPOSTASQUESTIONARIO_RESPOSTA_RespostasQuestionario_ID FOREIGN KEY (RespostasQuestionario_ID) REFERENCES RESPOSTASQUESTIONARIO (ID);
ALTER TABLE CONFIGURACAOPAGINA_QUESTAO ADD CONSTRAINT FK_CONFIGURACAOPAGINA_QUESTAO_questoes_ID FOREIGN KEY (questoes_ID) REFERENCES QUESTAO (ID);
ALTER TABLE CONFIGURACAOPAGINA_QUESTAO ADD CONSTRAINT FK_CONFIGURACAOPAGINA_QUESTAO_ConfiguracaoPagina_ID FOREIGN KEY (ConfiguracaoPagina_ID) REFERENCES CONFIGURACAOPAGINA (ID);
CREATE SEQUENCE seq_config_pagina START WITH 1;
CREATE SEQUENCE seq_questao START WITH 1;
CREATE SEQUENCE seq_usuario START WITH 1;
CREATE SEQUENCE seq_resposta START WITH 1;
CREATE SEQUENCE seq_questao_obj_alternativa START WITH 1;
CREATE SEQUENCE seq_turma START WITH 1;
CREATE SEQUENCE seq_respostas_questionario START WITH 1;
CREATE SEQUENCE seq_questionario START WITH 1;
CREATE SEQUENCE seq_mat_configurado START WITH 1;
CREATE SEQUENCE seq_leitura START WITH 1;
CREATE SEQUENCE seq_material START WITH 1;
CREATE SEQUENCE seq_tarefa START WITH 1;
CREATE SEQUENCE seq_atividade START WITH 1;
CREATE SEQUENCE seq_tarefa_individual START WITH 1;