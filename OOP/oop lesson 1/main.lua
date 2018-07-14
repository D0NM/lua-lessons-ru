class = require "lib.middleclass"

Mlekopit = class("Mlekopit")

function Mlekopit:initialize(ima, eda)
	self.ima = ima
	self.eda = eda or "НЕПОЙМИЧТО"
	self.x, self.y = 0, 0
	self.nashelEdu = true
end
function Mlekopit:idi()
	print(self.ima.." идёт куда-то...")
end
function Mlekopit:golos()
	print(self.ima.." что-то пищит...")
end
function Mlekopit:naidiEdu()
	if self.nashelEdu then
		print(self.ima.." уже нашел "..self.eda..". Не будет искать новую.")
	else
		print("Ура, "..self.ima.." нашел "..self.eda.."...")
		self.nashelEdu = true
	end
end
function Mlekopit:est(eda)
	if eda then
		print(self.ima.." съел "..eda.."...")
		return
	end	

	if self.nashelEdu then
		print(self.ima.." съел "..self.eda.."...")
		self.nashelEdu = false
	else
		print("У "..self.ima.." нет еды...")
	end
end

mlek1 = Mlekopit:new("Мышка", "сыр")
mlek1:golos()
mlek2 = Mlekopit:new("Белка", "огромный орех")
mlek2:golos()
mlek3 = Mlekopit:new("Медведь", "мёд")
function mlek3:golos()
	print(self.ima.." рычит...")
end
mlek3:golos()
mlek3:est()
mlek3:naidiEdu()
mlek3:est()
mlek1:est("грибочек")
mlek2:est()
mlek2:idi()
------
Chelovek = class("Chelovek", Mlekopit)
function Chelovek:golos()
	math.randomseed(os.time())
	if math.random() <= 0.5 then
		print(self.ima.." сказал умную фразу")
	else
		print(self.ima.." попросил помочь с задачей дня...")
	end
end
function Chelovek:naidiEdu()
	if self.nashelEdu then
		print(self.ima.." не шевелится. Он уже имеет "..self.eda.." в холодильнике.")
	else
		print(self.ima.." купил в магазине "..self.eda..".")
		self.nashelEdu = true
	end
end
function Chelovek:pishiCod()
	print(self.ima.." ленится и не пишет код.")
end
yan = Chelovek:new("человек Ян")
yan:golos()
yan:est()
yan:naidiEdu()
yan:est()
yan:pishiCod()
mlek1.pishiCod = Chelovek.pishiCod
mlek1:pishiCod()
mlek1.pishiCod(mlek1)
