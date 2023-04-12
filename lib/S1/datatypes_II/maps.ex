_maps = """
Whenever you need a key-value store, maps are the data structure to turn to in Elixir.
"""

days = %{"Monday" => "Lundi",
"Tuesday" => "Mardi",
"Wednesday" => "Mercredi",
"Thrusday" => "Jeudi",
"Friday" => "Vendredi",
"Saturday" => "Samedi",
"Sunday" => "Dimanche"}

animales = %{perro: "dog", gato: "cat", loro: "parrot", mono: "monkey", raton: "mouse"}


IO.inspect(days, label: "Map of days ENG-FR")
IO.inspect(animales, label: "Map of animals SPA-ENG")
IO.inspect(Map.keys(days), label: "Keys of map days")
IO.inspect(Map.values(days), label: "Values of map days")
IO.inspect(Map.get(days, "Friday"), label: "Get value of key \"Friday\"")
IO.inspect(Map.get(animales, :gato), label: "Get value of key \":gato\"")
IO.inspect(Map.has_key?(days, "Sunday"), label: "Has key Sunday in days? ")
IO.inspect(Map.has_key?(animales, :llama), label: "Has key llama in animales?")

#Overwrites the existing value with the new value. If the key does not exist in the map, Map.put/3 adds the key-value pair to the map.
IO.inspect(Map.put(animales, :perro, "dog 2"), label: "Put a new key/value")

#If the key already exists in the map, Map.put_new/3 does not modify the map.
#If the key does not exist in the map, Map.put_new/3 adds the key-value pair to the map and returns the updated map.
IO.inspect(Map.put_new(animales, :perro, "dog 2"), label: "Put a new key/value #2")

