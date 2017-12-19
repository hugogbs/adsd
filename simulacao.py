#!/usr/bin/env python
# -*- coding: utf-8 -*-

import random
import time
import numpy as np

class Simulacao:
	
    proxima_chegada = -1
    termino = -1
    dist_termino = []
    momento = 0
    
    tipo_distribuicao = "normal"
    parametros = [0,0.1,1000000]
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

    def __init__(self, tipo_distribuicao, qtd_repeticoes, parametros, valor_medio_tempo, duracao):
        self.qtd_repeticoes = qtd_repeticoes
        self.tipo_distribuicao = tipo_distribuicao
        self.parametros = parametros
        self.valor_medio_tempo = valor_medio_tempo
        self.duracao = duracao
       
        self.f = open('resultado_uni.txt', 'w')
        
    def get_distribuicao(self):
        if self.tipo_distribuicao == "normal":
            return np.random.normal(self.parametros[0],self.parametros[1],self.parametros[2])
        elif self.tipo_distribuicao == "exponencial":
            return np.random.exponential(self.parametros[0],self.parametros[2])
        elif self.tipo_distribuicao == "uniforme":
            return np.random.uniform(self.parametros[0],self.parametros[1],self.parametros[2])
			
    def run(self):		
        self.distribuicao = self.get_distribuicao()
        self.dist_termino = np.random.exponential(1,self.parametros[2])
        self.simular()
    
    def simular(self):
        for n in xrange(self.qtd_repeticoes):
            inicio = time.time()
            qtd_requisicoes_fila = 0
            fila_len_counter = 0
            resultado = ""
            self.momento = 0
            
            self.proxima_chegada = -1
            self.termino = -1
            
            self.fila = []
            self.qtd_req_recebidas = 0
            self.qtd_req_atendidas = 0
            self.media_elem_espera = 0
            self.media_tempo_att = 0
            self.tempo_att = 0		
            self.entrada_server = 0
            print(n)
            
            self.escalona_chegada_fila()
            while(self.duracao > time.time() - inicio):
                # Quando se atinge o momento de término de uso do servidor
                if self.dist_termino[self.termino] <= time.time() - inicio:
                    self.qtd_req_atendidas += 1
                    tempo_saida = time.time()
                    if self.fila:
                        self.aloca_servidor()
                        self.fila.pop()
                    else:
                        self.servidor_livre = True                               
                    self.tempo_att += abs(tempo_saida - self.entrada_server)

                # Quando se atinge o momento de chegada de um elemento na lista 1
                if self.proxima_chegada <= time.time() - inicio:
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
        print self.momento
        self.proxima_chegada = abs(self.distribuicao[self.momento])
        self.momento += 1

    def aloca_servidor(self):
        self.servidor_livre = False
        self.termino += 1
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

sim = Simulacao("normal",5,[0,0.1,1000000],4,5)
sim.run()
