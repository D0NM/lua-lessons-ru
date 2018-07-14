local myVar = 100

a = 10
do

	local b = 5
	print(b, a) 
end
print(b, a)

-- регистр переменных
g = 12
G = 50
g = 13
print(g, G)

-- числа десятичные, восьмеричные и шестнадцатеричные
h1 = 200
h2 = 077
h3 = 0x31
print(h1, h2, h3)

-- строки
str1 = "hel'lo!"
str2 = 'he"llo!'
st3 = [["hello"
'hello!!!']]
print(str1,str2, st3)
-- сложные строки
st4 = [===[ ]==]text2
text2
text3 ]===]
print(st4)
-- множественное присваивание
a = 12
b = a
print(a, b)

-- приведение типов
--tostring()
--tonumber()
--s = io.read()
--s = tonumber( s )
--s = s * 2
--print(s)
--io.read()

s2 = "stroka1"
s3 = tostring(true)
print(s2..s3)