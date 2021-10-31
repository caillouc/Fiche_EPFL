---
title: Fiche Introduction to multiprocessor architecture
author: Pierre Colson
date: Saturday 30 October
output: pdf_document
---

## General 

* $P = CV^2f$ P = **Power**; V = Operating voltages; f = Operating voltages; C = Capacitance
* **Dennard’s Law** Voltages used to go down
* **Moore’s Law** is the observation that the number of transistors in a dense integrated circuit (IC) doubles about every two years.
Moore's law is an observation and projection of a historical trend.
Rather than a law of physics, it is an empirical relationship linked to gains from experience in production.
* Processor & core used interchangeably
* Cores run threads
* Each chip has multiple cores
* Each board can have multiple chips
* Each platform can have multiple boards

## Parallelism

* **Amdahl’s law** : if you speed up only a small fraction of the execution time of a computation, the speedup you achieve on the whole computation is limited!

$$ speedup = \frac{1}{\frac{Fraction_{enhanced}}{Speedup_{enhanced}} + (1 - Fraction_{enhanced}} $$

## Coherence

* Cache coherence makes sure all copies of one address have the same value
* Cache set = cache line
* Cache block : number of data in a line
* **Compulsory** misses Access data for the first time
* **Capacity** misses when the cache is not big enough
* **Conflict** misses when two addresses map to the same set and way of the cache, evicting one of them
* Naïve Solution – Valid and Invalid Protocol
* **MSI**
	* Modified (Dirty) This cache has updated the value and holds the authoritative copy
	* Shared (Valid) One or more caches hold the value, read permission only
	* Invalid
* **MESI** protocol reduces bus contention by eliminating BusInv messages
* **Directory Based Protocol** his directory to keep track of the status of all cache blocks, the status of each block includes in which cache coherence "state" that block is, and which nodes are sharing that block at that time, which can be used to eliminate the need to broadcast all the signals to all nodes, and only send it to the nodes that are interested in this single block.

## Optimization

* **Coherence** misses when a block is removed due to coherence messages from another core
* **True sharing** when processors modify a same cache block (same data); To optimize we can : 
	* Divide up input data in advance
	* Privatize results when possible, reduce communication
* **False sharing** Processors updating different data which happen to be in the same cache block
* **The Locality Principle** 
	* Problem: Bad page replacement policies led to swapping and unusable machines
	* Solution: Design memory to prioritize the “working set” of the currently executing applications

## Consistency

* Types of Memory Dependences
	* Read After Write (RAW)
	* Write After Read (WAR)
	* Write After Write (WAW)
* **Load Store Queue** (LSQ) 
	* Load Store Queue
	* Hold all store operations until they retire
* **Store buffer** buffer for store operations ^^
* **Sequencial consistency** : Exucute things in program order 
* **Optimized sequencial consistency** : Allow peek 
* **Processor consistency** (PC) : Reads can bypass write (used today by x86) 
* **Weak consitency** 
	* Only synchronization operations have any ordering
	* Data ops. have no order enforced among themselves
	* Weak Consistency is used in ARM
	* Synch. instructions are called Fences
		* Enforces program order for operations before/after
* Basic consistency models: SC, PC, Weak
