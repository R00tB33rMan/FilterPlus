<!-- Variables -->
[airplane]: https://github.com/TECHNOVE/Airplane
[contactpurpur]: https://github.com/PurpurMC/Purpur#contact
[petal]: https://github.com/Bloom-host/Petal
[petalissues]: https://github.com/Bloom-host/Petal/issues
[pufferfish]: https://github.com/pufferfish-gg/Pufferfish
[purpur]: https://github.com/PurpurMC/Purpur
[slice]: https://github.com/Cryptite/Slice

<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/3/37/Filter.svg/476px-Filter.svg.png" alt="Specialized Filter" align="right">

# Filter+

Bee is an experimental fork of [Petal][petal]* that aims to fill the gaps of upstream!

<sub>*Filter+'s base is [Purpur][purpur] but with stashed Petal patches to get a faster upstream. (Thanks to the [Purpur Discord][contactpurpur] support!)</sub>

## Disclaimers

- **This project is experimental and is reserved for advanced and aware users.**

- Bee was originally a private fork that I made public after experiencing some demand, but I will update it and use patches for my purposes.

- As Bee is behaving like a fork of an experimental Minecraft server software named [Petal][petal], it contains the same problems as this one, refer to the [Petal's Github issue section][petalissues] to know what bugs/inconsistencies are currently present in Petal.

## Filter+'s Features

- **Faster upstream than Petal** Since the Petal developer is very busy they don't regularly upstream Purpur, Bee does not have this problem unless a major upstream code change leads to compilation errors due to Petal patches.

- **Logical patches** Like preventing fire packets from being sent if a player has fire resistance. (Ported from [Slice][slice])

- **Every change made to Bee that affects gameplay is configurable**

## Upstream Features

- **Async Pathfinding** Entity pathfinding is offloaded to asynchronous threads to significantly reduce processing from the main thread ([Petal][petal])
- **Multi-threaded Entity Tracking** Entity tracking can take advantage of multiple threads to greatly reduce dependence on main thread processing ([Petal][petal])
- **Optimization Patches** Reducing work done by game event system and reducing sensor work thanks to a simpler code behaviour ([Petal][petal])
- **New fun and exciting gameplay features** Configure gameplay easily without the headache of searching for plugins! ([Purpur][purpur])
- **Sentry Integration** Easily track all errors coming from your server in excruciating detail ([Pufferfish][pufferfish])
- **Better Entity Performance** Reduces the performance impact of entities by skipping useless work and making barely-noticeable changes to behavior ([Pufferfish][pufferfish])
- **Partial Asynchronous Processing** Partially offloads some heavy work to other threads where possible without sacrificing stability ([Pufferfish][pufferfish])
- **8x Faster Map Rendering** Reduces or eliminates lag spikes caused by plugins like ImageOnMap or ImageMaps ([Pufferfish][pufferfish])
- **30% faster hoppers** over Paper ([Pufferfish][pufferfish] originally by [Airplane][airplane])
- **Reduced GC times & frequency** from removing useless allocations, which also improves CPU performance ([Pufferfish][pufferfish] originally by [Airplane][airplane])
- **Fast raytracing** which improves performance of any entity which utilizes line of sight, mainly Villagers ([Pufferfish][pufferfish] originally by [Airplane][airplane])
- **Built-in profiler** which has 0 performance hit and easy to read metrics for both server owners and developers ([Pufferfish][pufferfish] originally by [Airplane][airplane])

## Licence

All patches are licensed under the MIT license, unless otherwise noted in the patch headers.
