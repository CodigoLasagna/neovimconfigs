local main_dir = ""
if (Hostname == "LEGION") then
	main_dir = "~/vault/coding/notes/"
elseif (Hostname == "EONIX") then
	main_dir = "~/work/coding/notes/"
elseif (Hostname == "OMNIA") then
	main_dir = "~/archive/work/coding/notes/"
end

local work_dir = main_dir .. "work"
local school_dir = main_dir .. "school"
local mundane_dir = main_dir .. "mundane"
local todo_dir = main_dir .. "todo_dir"
local hashkeys_dir = main_dir .. "hashkeys"

require'neorg'.setup
{
	load =
	{
		['core.defaults'] = {},
		['core.concealer'] =
		{
			config =
			{
				icon_preset = "diamond"
			}
		},
		['core.dirman'] =
		{
			config =
			{
				workspaces =
				{
					main = main_dir,
					default = main_dir,
					mundane = mundane_dir,
					work = work_dir,
					school = school_dir,
					hashkeys = hashkeys_dir,
					todo_dir = todo_dir,
				}
			}
		}
	}
}
