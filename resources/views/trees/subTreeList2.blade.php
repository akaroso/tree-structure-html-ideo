@foreach ($childs as $tree)



    @php $color= 'blue' @endphp

    <tbody class="bg-{{$color}}-{{$tree->depth*100}} divide-y divide-gray-200">

        <tr>
            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                {{ $tree->id }}
            </td>

            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                {{ $tree->text }}
            </td>

            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">
                {{ $tree->depth }}
            </td>

            <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                <a href="{{ route('trees.show', $tree->id) }}" class="text-blue-600 hover:text-blue-900 mb-2 mr-2">Add Node</a>
                <a href="{{ route('trees.edit', $tree->id) }}" class="text-indigo-600 hover:text-indigo-900 mb-2 mr-2">Edit/Move</a>
                <form class="inline-block" action="{{ route('trees.destroy', $tree->id) }}" method="POST" onsubmit="return confirm('Are you sure?');">
                    <input type="hidden" name="_method" value="DELETE">
                    <input type="hidden" name="_token" value="{{ csrf_token() }}">
                    <input type="submit" class="text-red-600 hover:text-red-900 mb-2 mr-2" value="Delete">
                </form>
            </td>
        </tr>

        @include('trees.subTreeList2',['childs' => $tree->children])

    </tbody>
    @endforeach
