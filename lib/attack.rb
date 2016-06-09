class Attack

  def default_attack(defender, _ = nil)
    damage = 5 + rand(11)
    defender.deduct(damage)
    defender.paralyze if Kernel.rand(10) < 2
    defender.log "#{ defender.name } got attacked"
  end

  def suffer_poison(attacker, _ = nil)
    attacker.deduct(1 + Kernel.rand(4))
  end

  def poison_attack(defender, _ = nil)
    defender.poison if Kernel.rand(10) < 7
    defender.deduct(2 + Kernel.rand(3))
    defender.log ("#{ defender.name } got hit!") unless defender.poisoned
    defender.log ("#{ defender.name } got poisoned!") if defender.poisoned
  end

  def sleep_attack(defender, _ = nil)
    defender.set_asleep
    defender.log ("#{ defender.name } fell asleep!")
  end

  def heal(defender, attacker)
    attacker.heal
    defender.log ("#{ attacker.name } healed!")
  end

end
