-- File: lua/utils.lua
local M = {}

-- Function to find the nearest jest.config.js
function M.find_nearest_jest_config(start_path)
  local path_sep = package.config:sub(1, 1)
  local function path_join(...)
    return table.concat({ ... }, path_sep)
  end

  local function exists(file)
    local ok, err, code = os.rename(file, file)
    if not ok then
      if code == 13 then
        -- Permission denied, but it exists
        return true
      end
    end
    return ok
  end

  local function is_dir(file)
    return exists(file .. path_sep)
  end

  local function parent_dir(path)
    return path:match("(.*" .. path_sep .. ")")
  end

  local function find_file_in_parent_dirs(filename, path)
    local current_path = path
    while current_path do
      local file_path = path_join(current_path, filename)
      if exists(file_path) then
        return file_path
      end
      current_path = parent_dir(current_path)
    end
    return nil
  end

  return find_file_in_parent_dirs("jest.config.js", start_path)
end

return M
