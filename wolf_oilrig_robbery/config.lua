Config = {}

Config.MinPolice = 1
Config.target = 'qtarget' -- Accessible Targets: bt-target, qtarget, ox_target, qb-target
Config.MainGrave = {
  -- CLIENT SIDE

	    Cooldown = 25, -- in minutes
	    PedName = "u_m_m_streetart_01",     
		PedPos = vector4(-3045.2727, 7353.9004, 8.0024, 151.6122),
        Camerapos = vector3(-2934.5935, 7453.0845, 109.2743),
		Playerpos = vector4(-3046.0200, 7352.0684, 7.9960, 333.5603),
        Coffin1pos = vector4(-3037.9434, 7469.0635, 50.7454, 34.3338),
		Coffin2pos = vector4(-3051.1267, 7449.3633, 50.7784, 127.2076),
		Coffin3pos = vector4(-3013.1184, 7461.3018, 50.8111, 126.1005),
		Coffin4pos = vector4(-3004.4016, 7465.9629, 58.5317, 307.2935),
		Coffin5pos = vector4(-3056.4297, 7499.6606, 50.8428, 22.9697),
		lastRobbed = 0,
		camlook = vector3(-3029.4871, 7473.8013, 71.6734),
		


  -- SERVER SIDE ---- Amount selling

       Enable2itemsReward = false,
       ItemReward = "bread",
	   ItemReward_amount = 1,
	   Item2Reward = "bread", -- if is a Enable2itemsReward = true
	   Item2Reward_amount = 1,
	   Item3Reward = "bread",
	   Item3Reward_amount = 1,
	   Item4Reward = "bread", -- if is a Enable2itemsReward = true
	   Item4Reward_amount = 1,
	   ItemMoneyReward = 15000,
	   Item2MoneyReward = 10000,
	   Item3MoneyReward = 8000,
	   Item4MoneyReward = 8000,


  -- Notifications 

  Cam1 = "Listen carefully.",
  Cam2 = "Go to the Cemetery and Destroy 5 Tombstones.",
  Cam3 = "I see you here in 10 minutes.",
  HaveItem = "You have received Payment for Items",
  NotHaveItem = "You have no Items that interest me",

}