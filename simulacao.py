#!/usr/bin/env python
# -*- coding: utf-8 -*-

import random

class Simulacao:

    fila_1 = []
    proxima_chegada_1 = -1
    termino = -1
    momento = 0
    servidor_livre = True
    qtd_eventos = 0

    def __init__(self, qtd_eventos):
        self.qtd_eventos = qtd_eventos
        self.f = open('resultado', 'w')

    def escalona_chegada_fila_1(self):
        self.proxima_chegada_1 = random.randint(1, 10) + self.momento

    def aloca_servidor(self):
        self.servidor_livre = False
        self.termino = random.randint(3, 7) + self.momento

    def print_estado_sistema(self, tipo_evento):
        self.f.write("Tipo de evento: " + tipo_evento +
        ", Momento do evento: " + str(self.momento) +
        (("\nElementos na Fila: " + str(self.fila_1)) if len(self.fila_1) > 0 else "\nElementos na Fila: Livre") +
        ((" Término em " + str(self.termino)) if not self.servidor_livre else "Nenhum"))
        self.f.write("\n\n")
        self.qtd_eventos = self.qtd_eventos - 1

    def run(self):
        self.escalona_chegada_fila_1()
        while(self.qtd_eventos > 0):
            self.momento = self.momento + 1
            # Quando se atinge o momento de término de uso do servidor
            if self.termino == self.momento:
                if self.fila_1:
                    self.aloca_servidor()
                    self.fila_1.pop()
                else:
                    self.servidor_livre = True
                self.print_estado_sistema("Saída")

            # Quando se atinge o momento de chegada de um elemento na lista 1
            if self.proxima_chegada_1 == self.momento:
                self.escalona_chegada_fila_1()
                if self.servidor_livre:
                    self.aloca_servidor()
                else:
                    self.fila_1.append('Fregues')
                self.print_estado_sistema("Chegada")


sim = Simulacao(500)
sim.run()
