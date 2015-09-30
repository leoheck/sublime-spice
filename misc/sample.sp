FIRST LINE SHOULD BE IGNORED (TREATED AS A COMMENT)

* COMENTÁRIO DE LINHA

.include my_file.sp
.include /path/to/my_file.sp

.ic v(node) = 10uV
.ic V(node) 10V
.ic V(node) = 10V I(node) = 5mA

.param MYPARAM = 10e-3V
.param MYPARAM = 10mV
.param MYPARAM = '100 * 3.3V'
.param MYPARAM 10V

.tran 10f 300ns
.dc 10f 300ns
.dc 10p 300ns 1p
.DC var START = start1 STOP = stop1 STEP = incr1

vname node+ node- MYPARAM
vname node+ node- 1.2V
vname node+ node- dc 1.2V
vname node+ node- DC 1.2V
vname node+ node- dc = 1.2V
vname node+ node- dc ( 1.2V )
vname node+ node- dc = ( 1.2V )
vname node+ node- DC = ( 1.2V )

iname node+ node- 1.2V

cname node+ node- valuev
rname node+ node- valuev
dname node+ node- valuev
mname source gate drain bulk nmos w=100n l=60n

cname node+ node- 10fF ; inline comment
cname node+ node- 10fF $ inline comment

xname node node node node XREFERENCE
xname node node node node xref
xname node node node node xref w=10 l=20

* Multiline statement with + sign
xname node node node node
+ node node node node XREFERENCE

* Example of simple subcircuit with ends name
.subckt SUBCKT_NAME in out VDD GND
xiv1 in n1  vdd gnd INV
xiv2 n1 out vdd gnd INV
.ends SUBCKT_NAME

* Example of simple subcircuit
.subckt SUBCKT_NAME in out vdd gnd params: cap=10fF
xiv1 in n1  vdd gnd INV
xiv2 n1 out vdd gnd INV
cname n1 0 cap
.ends



* RESISTORS
*========================================================

* General form:
RXXXXXXX N1 N2 VALUE

* Examples:
R1 1 2 100 dclalala
RC1 12 17 1K

* Semiconductor Resistors, general form:
RXXXXXXX N1 N2 <VALUE> <MNAME> <L=LENGTH> <W=WIDTH> <TEMP=T>

* Examples:
RLOAD 2 10 10K
RMOD 3 7 RMODEL L=10u W=1u>

* CAPACITORS
*========================================================

* General form:
CXXXXXXX N+ N- VALUE <IC=INCOND>

* Examples:
CBYP 13 0 1UF
COSC 17 23 10U IC=3V

* Semiconductor Capacitors, general form:
CXXXXXXX N1 N2 <VALUE> <MNAME> <L=LENGTH> <W=WIDTH> <IC=VAL>

* Examples:
CLOAD 2 10 10P
CMOD 3 7 CMODEL L=10u W=1u
