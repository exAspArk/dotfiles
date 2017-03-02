def deep_sort(hash)
  hash.sort.map { |(k, v)|
    case v
    when Hash
      [k, deep_sort(v)]
    when Array
      [k, v.sort_by(&:to_s)]
    else
      [k, v]
    end
  }.to_h
end
