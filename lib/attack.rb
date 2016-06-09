class Attack

  def default_attack(defender)
    damage = 5 + rand(11)
    defender.deduct(damage)
    defender.paralyze if srand(10) < 2
    defender.log "#{ defender.name } got attacked"
  end

  def suffer_poison(attacker)
    attacker.deduct(1 + srand(4))
  end

  def poison_attack(defender)
    defender.poison if srand(10) < 7
    defender.deduct(2 + rand(3))
    defender.log ("#{ defender.name } got hit!") unless defender.poisoned
    defender.log ("#{ defender.name } got poisoned!") if defender.poisoned
  end

  def sleep_attack(defender)
    defender.set_asleep
    defender.log ("#{ defender.name } fell asleep!")
  end

end