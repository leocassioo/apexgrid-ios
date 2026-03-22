# Apex Forza - Product Brief v0.2

## 1. Objetivo do documento
Este documento organiza a visao inicial do aplicativo **Apex Forza** para que o time refine escopo, prioridades e regras de produto com foco no que gera valor real para a comunidade de Forza Horizon.

## 2. Visao do produto
Criar o app de referencia para:
- organizar encontros e eventos com menos caos na entrada do comboio;
- compartilhar tunagens de forma confiavel e facil de encontrar;
- fortalecer uma comunidade ativa com reputacao, descoberta e colaboracao.

## 3. Problema principal
Hoje a comunidade normalmente sofre com:
- divulgacao dispersa de eventos (grupos diferentes, regras pouco claras);
- dificuldade para encontrar tunagem certa por carro, estilo e periferico;
- baixa confianca entre jogadores (faltas, mau comportamento, pouca curadoria).

## 4. Publico-alvo inicial
- Organizador de eventos (host de comboio).
- Tuner (jogador que cria e valida setups).
- Piloto casual (quer entrar em evento pronto e setup rapido).
- Criador de conteudo (foto, livery, clips, comunidade).

## 5. Proposta de valor
**Para o organizador:** fluxo simples para criar evento, controlar vagas e validar presenca.  
**Para o piloto:** encontrar evento certo e setup certo em minutos.  
**Para a comunidade:** reputacao e historico para premiar colaboracao e reduzir comportamento toxico.

## 6. Pilares e escopo funcional

### 6.1 Organizacao de Eventos
**Objetivo:** reduzir friccao entre anuncio do evento e entrada em comboio.

Funcionalidades:
- Criacao de encontros com data, hora, regras e limite de vagas.
- Mapa de concentracao com ponto marcado.
- Gestao de vagas com lista de espera automatica.
- Confirmacao de presenca (RSVP) e check-in pelo organizador.
- Chat temporario do evento.
- Reputacao do piloto baseada em presenca e conduta.

Regras de negocio iniciais:
- Cada evento deve ter titulo, horario de inicio e regras minimas (classe/tipo).
- Ao liberar vaga, primeiro da fila de espera recebe convite automatico.
- Check-in fecha no horario configurado pelo organizador.
- Reputacao nao deve depender so de likes; peso maior para presenca validada.

### 6.2 Hub de Tunagens
**Objetivo:** tornar setups descobriveis, testaveis e comparaveis.

Funcionalidades:
- Repositorio de share codes com busca por carro, categoria e objetivo.
- Publicacao opcional de sliders tecnicos.
- Marcacao de periferico alvo (controle, volante ou ambos).
- Feedback da comunidade com nota, comentario e contexto de teste.

Regras de negocio iniciais:
- Cada setup precisa de metadados minimos: carro, classe, uso (road/drift/offroad etc).
- Feedback deve exigir "contexto de uso" para aumentar qualidade (pista, clima, input).
- Setup pode ser sinalizado por inconsistencias (codigo invalido, info incompleta).

### 6.3 Rede Social e Perfil
**Objetivo:** criar identidade e recorrencia dentro da comunidade.

Funcionalidades:
- GamerCard com GamerTag, plataforma, estilo e reputacao.
- Garagem virtual com carros favoritos e fotos.
- Feed de descoberta para fotos, liveries e eventos em alta.
- Sistema de seguidores para tuners/fotografos/organizadores.
- Concursos semanais de fotografia com votacao.

Regras de negocio iniciais:
- Perfil publico por padrao, com controles de privacidade basicos.
- Feed deve priorizar relevancia local da comunidade + tendencia recente.
- Concurso semanal com janela fixa (submissao -> votacao -> resultado).

## 7. Priorizacao (MVP x Pos-MVP)

### MVP (fase 1)
- Cadastro/login + GamerCard basico.
- Criacao e listagem de eventos com calendario visual semanal.
- RSVP + controle de vagas + lista de espera + notificacoes de lembrete.
- Check-in basico de presenca pelo organizador.
- Reputacao v1 focada em presenca validada e denuncias.
- Repositorio de share codes com busca.
- Publicacao simples de setup (com periferico alvo).
- Avaliacao basica de setup (nota + comentario curto).

### Pos-MVP (fase 2)
- Chat temporario por evento.
- Garagem virtual.
- Feed de descoberta v1.

### Expansao (fase 3)
- Concursos de fotografia completos.
- Ranking sazonal de organizadores/tuners.
- Recomendacao personalizada de eventos e setups.

## 8. Fluxos criticos (primeira versao)

### Fluxo A: Organizador cria evento
1. Definir titulo, horario, regras e limite de vagas.
2. Publicar evento e compartilhar link interno.
3. Acompanhar lista de confirmados e fila de espera.
4. Executar check-in (fase 1).

### Fluxo B: Piloto encontra evento e entra
1. Buscar eventos por horario/tema/regra.
2. Confirmar participacao.
3. Entrar em fila de espera se lotado.
4. Receber notificacao quando vaga abrir.

### Fluxo C: Tuner publica setup
1. Selecionar carro/categoria/objetivo.
2. Informar share code + sliders opcionais.
3. Marcar periferico recomendado.
4. Receber feedback e iterar setup.

## 9. Metricas de sucesso (KPIs)
- `% eventos com lotacao completa`.
- `% participantes com presenca validada`.
- `tempo medio para preencher vagas`.
- `busca -> uso de setup` (conversao).
- `nota media de setup com >= 5 avaliacoes`.
- `retencao semanal` (organizadores, tuners, pilotos).
- `taxa de denuncia por 100 usuarios ativos`.

## 10. Riscos e mitigacoes
- Spam/baixa qualidade de conteudo -> moderacao, denuncia e reputacao.
- Abuso em votacao/comentario -> limites por conta e analise de fraude.
- Complexidade alta no inicio -> focar MVP estrito e release em fases.
- Dependencia de conteudo inicial -> programa de creators fundadores.

## 11. Requisitos nao funcionais (versao inicial)
- App iOS com experiencia mobile-first.
- Resposta de tela principal em ate 2s em rede estavel.
- Busca de setups com filtros em ate 1s para consultas comuns.
- Logs basicos de eventos de produto para analise de funil.
- Politica minima de seguranca e privacidade de dados de perfil.

## 12. Backlog de decisoes para refinamento
- Como calcular reputacao (pesos, decaimento, penalidades)?
- Quais filtros de evento sao obrigatorios no MVP?
- Quais categorias de tunagem entram no lancamento?
- Qual regra de moderacao para chat/comentarios?
- Qual estrategia de seed inicial de conteudo?

## 13. Insights da pesquisa (coleta em 02/03/2026)
Fonte: arquivo de respostas do formulario enviado pelo fundador.

### 13.1 Tamanho e perfil da amostra
- `34` respostas totais.
- Plataforma principal: `Xbox 19 (56%)`, `PC 8 (24%)`, `PS5 5 (15%)`, `Cloud 2 (6%)`.
- SO do celular: `Android 24 (71%)`, `iOS 10 (29%)`.
- Frequencia de jogo: `24 (71%)` jogam diariamente.
- Perfil: `30 (88%)` participantes e `4 (12%)` tuners/fotografos.
- Interesse beta: `27/34 (79%)` deixaram GamerTag ou e-mail.

### 13.2 Onde eventos acontecem hoje
Entre participantes (`n=30`):
- WhatsApp: `26 (87%)`.
- Discord: `18 (60%)`.
- Boca a boca/amigos: `9 (30%)`.
- Facebook: `6 (20%)`.

Leitura de produto:
- O app precisa funcionar como camada de organizacao sobre canais atuais, nao como substituicao brusca de comunidade.

### 13.3 Dores mais fortes de quem participa de eventos
Entre participantes (`n=30`):
- Trolls/falta de etiqueta: `25 (83%)`.
- Regras mal explicadas/ignoradas: `18 (60%)`.
- Horarios confusos/mudanca de ultima hora: `13 (43%)`.
- Dificuldade de encontrar lider/sessao no mapa: `6 (20%)`.

Leitura de produto:
- Moderacao, check-in e clareza de regras nao sao extras; sao requisitos do nucleo do produto.

### 13.4 Funcionalidades que mais puxam adocao
Preferencias para trocar Discord/WhatsApp (participantes, `n=30`):
- Fotos/especificacoes de carros antes do evento: `20 (67%)`.
- Biblioteca de tunagens por evento: `20 (67%)`.
- Notificacoes de lembrete: `20 (67%)`.
- Check-in + reputacao para filtrar pilotos: `13 (43%)`.

Recursos indispensaveis no app (amostra total, `n=34`):
- Calendario visual semanal: `29 (85%)`.
- Busca de tunagens por share code/categoria: `23 (68%)`.
- Integracao facil com fotos do jogo: `22 (65%)`.
- Ranking de pilotos/organizadores: `21 (62%)`.

### 13.5 Sinais de creators (tuners/fotografos, `n=4`)
- `3/4` querem publicar sliders alem do share code.
- Frustracoes recorrentes: baixa descoberta, busca oficial limitada e falta de feedback real.
- Definicao de "elite" citada: validacao por uso real e avaliacao de qualidade (nao so volume de downloads).

### 13.6 Monetizacao e risco comercial
- `7/34 (21%)` pagariam se houver valor claro.
- `24/34 (71%)` talvez paguem conforme preco/recursos.
- `3/34 (9%)` so usariam se gratis.

Leitura de produto:
- Primeiro provar valor e retencao; monetizacao deve entrar apos ajuste de produto/mercado.

### 13.7 Lacunas da pesquisa atual
- `0` respostas de organizadores nos blocos especificos de operacao de evento.
- Precisamos de uma segunda rodada focada em hosts para validar:
  - fluxo de criacao e check-in;
  - dor operacional (inscricoes, regras, comunicacao, no-show);
  - interesse real em ferramentas de card e automacao.

## 14. Decisoes de produto apos pesquisa
- Calendario visual semanal entra como item explicito de MVP.
- Notificacoes de evento entram no MVP.
- Check-in e reputacao basica entram no MVP para atacar dor de troll/no-show.
- Biblioteca de tunagens por evento e busca por share code ficam como core do MVP.
- Ranking completo e feed social avancado ficam para fase 2/3.

## 15. Proximo passo sugerido
Converter este brief em:
- PRD v1 com requisitos detalhados por tela/acao.
- Roadmap de entregas (sprints) ja alinhado aos dados da pesquisa.
- Modelo de dados inicial (usuarios, eventos, setups, feedback, reputacao, denuncias).
- Questionario de rodada 2 focado em organizadores de evento.
