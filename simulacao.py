#!/usr/bin/env python
# -*- coding: utf-8 -*-

import random
import time

class Simulacao:
	
    proxima_chegada = -1
    termino = -1
    momento = 0
    
    tipo_distribuicao = "normal"
    parametros = [3,1]
    valor_medio_tempo = 4
    duracao = 5
    qtd_repeticoes = 1
	
    servidor_livre = True
	
    fila = []
    qtd_req_recebidas = 0
    qtd_req_atendidas = 0
    media_elem_espera = 0
    media_tempo_att = 0
    tempo_att = 0
    
    entrada_server = 0
	
    def __init__(self, tipo_distribuicao, qtd_repeticoes):
        self.qtd_repeticoes = qtd_repeticoes
        self.tipo_distribuicao = tipo_distribuicao
        self.f = open('resultado', 'w')
        
    def get_distribuicao(self):
        if self.tipo_distribuicao == "normal":
            return random.randint(1, 10)
        elif self.tipo_distribuicao == "exponencial":
            return random.randint(1, 10)
        elif self.tipo_distribuicao == "uniforme":
            return random.randint(1, 10)
			
    def run(self):		
        self.distribuicao = self.get_distribuicao()
        self.simular()
    
    def simular(self):
        for n in xrange(self.qtd_repeticoes):
            inicio = time.time()
            qtd_requisicoes_fila = 0
            fila_len_counter = 0
            resultado = ""
            print(n)
            
            self.escalona_chegada_fila()
            while(self.duracao > time.time() - inicio):
                #print(time.time() - inicio,self.duracao)
                self.momento = self.momento + 1
                # Quando se atinge o momento de término de uso do servidor
                if self.termino == self.momento:
                    self.qtd_req_atendidas += 1
                    tempo_saida = time.time()
                    if self.fila:
                        self.aloca_servidor()
                        self.fila.pop()
                    else:
                        self.servidor_livre = True
                    print self.tempo_att                     
                    self.tempo_att += (tempo_saida - self.entrada_server)

                # Quando se atinge o momento de chegada de um elemento na lista 1
                if self.proxima_chegada == self.momento:
                    self.qtd_req_recebidas += 1
                    self.escalona_chegada_fila()
                    if self.servidor_livre:
                        self.aloca_servidor()
                    else:
                        self.fila.append(time.time())
                        qtd_requisicoes_fila += 1
                        fila_len_counter += len(self.fila)
            self.media_tempo_att = self.tempo_att / self.qtd_req_atendidas
            self.media_elem_espera = float(fila_len_counter) / qtd_requisicoes_fila
            self.print_estado_sistema()				

    def escalona_chegada_fila(self):
        self.proxima_chegada = self.distribuicao + self.momento

    def aloca_servidor(self):
        self.servidor_livre = False
        self.termino = random.randint(3, 7) + self.momento
        self.entrada_server = time.time()

    def print_estado_sistema(self):        
        self.f.write("Distribuição de probabilidade: " + self.tipo_distribuicao + ", com parâmetros: " + str(self.parametros) + "\n" +
        "Valor médio:" + str(self.valor_medio_tempo) + "\n" +
        "Duração da Simulação:" + str(self.duracao)   + "\n" +
        "Quantidade de Requisições recebidas:" + str(self.qtd_req_recebidas) + "\n" +
        "Quantidade de Requisições atendidas:" + str(self.qtd_req_atendidas)  + "\n" +
        "Tempo médio de atendimento:" + str(self.media_tempo_att) + "\n" +
        "Quantidade média de elementos em espera:" + str(self.media_elem_espera) + "\n" +
        "\n\n")

sim = Simulacao("normal",1)
sim.run()
