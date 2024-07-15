require("basic")
local lfs = require("lfs")

local function scan_directories(parent_dir, output_file)
    -- Open the output file for writing
    local file = io.open(output_file, "w")
    if not file then
        print("Error: Unable to open output file for writing.")
        return
    end

    -- Iterate through each entry in the parent directory
    for entry in lfs.dir(parent_dir) do
        -- Skip the current and parent directory entries
        if entry ~= "." and entry ~= ".." then
            local full_path = parent_dir .. "/" .. entry
            local attr = lfs.attributes(full_path)
            -- Check if the entry is a directory
            if attr.mode == "directory" then
                -- Write the directory name to the output file
                file:write(entry .. "=" .. entry .. "=w0=1=1\n")
            end
        end
    end

    -- Close the output file
    file:close()
    print("Directory scan completed. Results saved to " .. output_file)
end

vim.fn.setenv("LANG", "en_US.UTF-8")

-- load projects
scan_directories(os.getenv("PROJECTS_HOME"), os.getenv("XDG_DATA_HOME") .. "/nvim/telescope-projects.txt")

vim.fn.chdir(os.getenv("PROJECTS_HOME"))