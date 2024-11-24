@echo off

REM TILDES: https://es.stackoverflow.com/questions/187834/problema-con-tildes-al-listar-archivos-con-cmd
chcp 1252 >NUL 2>&1

set name=Example
set input_file=%name%.md
set extensions=(html docx odt pdf)
set out_dir=generated

REM SINTAXIS: https://ss64.com/nt/for.html

if not exist %out_dir% (
    mkdir %out_dir%
)

for %%e in %extensions% do (
	echo "Generando fichero de extensión '%%e'..."
	pandoc %input_file% -o %out_dir%\%name%.%%e >NUL 2>&1
)

echo "Generando ascii doc a través de markdown para probar también asciidoctorj..."

pandoc %input_file% -o %out_dir%\%name%.adoc

for %%e in %extensions% do (
	echo "Generando fichero de extensión '%%e'..."
	asciidoctorj %out_dir%\%name%.adoc -o %out_dir%\%name%_adoc.%%e >NUL 2>&1
)